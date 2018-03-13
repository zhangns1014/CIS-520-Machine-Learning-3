%b_1 horizon
function [w_1,b_1,w_2,b_2]=sigmoid(X,Y,d,ita,iteration)
load(['setting-files/w1_' num2str(d) '.mat']);
load(['setting-files/b1_' num2str(d) '.mat']);
load(['setting-files/w2_' num2str(d) '.mat']);
load(['setting-files/b2_' num2str(d) '.mat']);
b_1=b1;
b_2=b2;

Y=((Y+1)/2)'; %Y lying
w_1=w_1';
X=X';
b_1=b_1';  %b_1 standing
m=size(X,2);  %input data number
for i=1:iteration
    b_2_new=mean(output(w_1,b_1,w_2,b_2,X)-Y);
    w_2_new=1/m*hiddenlayer(w_1,b_1,X)*(output(w_1,b_1,w_2,b_2,X)-Y)';
    %%
    b_1_new_1=repmat((output(w_1,b_1,w_2,b_2,X)-Y),d,1);
    b_1_new_2=repmat(w_2,1,m);
    b_1_new_3=hiddenlayer(w_1,b_1,X).*(1-hiddenlayer(w_1,b_1,X));
    b_1_new=1/m*sum(b_1_new_1.*b_1_new_2.*b_1_new_3,2);
    %%
    w_1_new=1/m*(b_1_new_1.*b_1_new_2.*b_1_new_3)*X';
    
    b_2=b_2-ita*b_2_new;
    w_2=w_2-ita*w_2_new;
    b_1=b_1-ita*b_1_new;
    w_1=w_1-ita*w_1_new;
    
end

end
    