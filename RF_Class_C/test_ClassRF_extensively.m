%run plethora of tests

%compile everything
% if strcmpi(computer,'PCWIN') |strcmpi(computer,'PCWIN64')
%    compile_windows
% else
%    compile_linux
% end

total_train_time=0;
total_test_time=0;

load ..\..\Data255\data
load ..\..\Data255\label

inputs = data(1:5*1000,:)';
outputs = double(label(1:5*1000));

clear data label
% 
%  load data/twonorm
% %twonorm, N=300, D=2
for i=1:5
	fprintf('%d,',i);
	tic;
	model=classRF_train(inputs',outputs,50);
    total_train_time=toc;
    tic;
	y_hat = classRF_predict(inputs',model);
	total_test_time=total_test_time+toc;	
    length(find(y_hat~=outputs))/length(outputs)
    %keyboard
end
fprintf('\nnum_tree %d: Avg train time %d, test time %d\n',1000,total_train_time/100,total_test_time/100);


