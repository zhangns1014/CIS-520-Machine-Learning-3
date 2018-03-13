%load data
train_data =load('train.txt'); 
test_data=load('test.txt');
validation_train(:,:,1)=load('CrossValidation/Fold1/cv-train.txt');
validation_test(:,:,1) =load('CrossValidation/Fold1/cv-test.txt');
validation_train(:,:,2)=load('CrossValidation/Fold2/cv-train.txt');
validation_test(:,:,2) =load('CrossValidation/Fold2/cv-test.txt');
validation_train(:,:,3)=load('CrossValidation/Fold3/cv-train.txt');
validation_test(:,:,3) =load('CrossValidation/Fold3/cv-test.txt');
validation_train(:,:,4)=load('CrossValidation/Fold4/cv-train.txt');
validation_test(:,:,4) =load('CrossValidation/Fold4/cv-test.txt');
validation_train(:,:,5)=load('CrossValidation/Fold5/cv-train.txt');
validation_test(:,:,5) =load('CrossValidation/Fold5/cv-test.txt');

X1=train_data(:,1:end-1);
Y1=train_data(:,end);
X2=test_data(:,1:end-1);
Y2=test_data(:,end);
%initialization
d=[1,5,10,15,25,50];
train_err=zeros(1,6);
test_err=zeros(1,6);
val_err=zeros(1,6);
ita=0.1;
iteration=5000;
for i=1:6
    [w_1,b_1,w_2,b_2]=sigmoid(X1,Y1,d(i),ita,iteration);
    y_train=(sign(output(w_1,b_1,w_2,b_2,X1')-1/2))';
    train_err(i)=classification_error(y_train,Y1);
    y_test=(sign(output(w_1,b_1,w_2,b_2,X2')-1/2))';
    test_err(i)=classification_error(y_test,Y2);
    
    %validation error
    sum_err=0;
    for j=1:5
        data1=validation_train(:,:,j);
        X3=data1(:,1:end-1);
        Y3=data1(:,end);
        data2=validation_test(:,:,j);
        X4=data2(:,1:end-1);
        Y4=data2(:,end);
        %%
        [w_1,b_1,w_2,b_2]=sigmoid(X3,Y3,d(i),ita,iteration);
        y_val=(sign(output(w_1,b_1,w_2,b_2,X4')-1/2))';
        sum_err=sum_err+classification_error(y_val,Y4);
    end
    val_err(i)=sum_err/5;
end

%plot
plot(d,train_err,'b*-');
hold on
plot(d,test_err,'ro-');
hold on
plot(d,val_err,'k*-');
title('P3a Sigmoid Error');
    
    
    
