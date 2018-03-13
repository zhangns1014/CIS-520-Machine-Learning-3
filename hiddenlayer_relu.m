function B=hiddenlayer_relu(w1,b1,x) 
A=w1*x+repmat(b1,1,size(x,2));
B=(sign(A)+1)/2.*A;
end