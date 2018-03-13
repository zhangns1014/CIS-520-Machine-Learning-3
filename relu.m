%b_1 horizon
function [w_1,b_1,w_2,b_2]=relu(X,Y,d,ita,iteration)
load('param.mat');

Y=Y'; %Y lying
w_1=W1';
X=X';
b_1=b1';  %b_1 standing
w_2=W2;
b_2=b2;
m=size(X,2);  %input data number
for i=1:iteration
    b_2_new=2*mean(output_relu(w_1,b_1,w_2,b_2,X)-Y);
    w_2_new=2/m*hiddenlayer_relu(w_1,b_1,X)*(output_relu(w_1,b_1,w_2,b_2,X)-Y)';
    %%
    b_1_new_1=repmat((output_relu(w_1,b_1,w_2,b_2,X)-Y),d,1);
    b_1_new_2=repmat(w_2,1,m);
    b_1_new_3=(sign(w_1*X+repmat(b_1,1,size(X,2)))+1)/2;
    b_1_new=2/m*sum(b_1_new_1.*b_1_new_2.*b_1_new_3,2);
    %%
    w_1_new=2/m*(b_1_new_1.*b_1_new_2.*b_1_new_3)*X';
    
    b_2=b_2-ita*b_2_new;
    w_2=w_2-ita*w_2_new;
    b_1=b_1-ita*b_1_new;
    w_1=w_1-ita*w_1_new;
    
end

end
    