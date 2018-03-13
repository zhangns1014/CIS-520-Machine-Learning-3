%load data
load('Data.mat');
load('Subsets.mat');

X2=test(:,1:end-1);
Y2=test(:,end);


%initialization
q=10:10:100;
train_err=zeros(1,10);
test_err=zeros(1,10);
d=15;
ita=0.1;
iteration=20000;
for i=1:10
    X1_total=subs{i};
    X1=X1_total(:,1:end-1);
    Y1=X1_total(:,end);
    [w_1,b_1,w_2,b_2]=relu(X1,Y1,d,ita,iteration);
    y_train=(output_relu(w_1,b_1,w_2,b_2,X1'))';
    train_err(i)=mean_squared_error(y_train,Y1);
    y_test=(output_relu(w_1,b_1,w_2,b_2,X2'))';
    test_err(i)=mean_squared_error(y_test,Y2);
    
end

%plot
plot(q,train_err,'b*-');
hold on
plot(q,test_err,'ro-');
title('P4a Relu Error');
    
    
    
