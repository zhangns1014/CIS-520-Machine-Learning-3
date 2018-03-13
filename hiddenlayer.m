%b1 standing x standing w1 lying
function B=hiddenlayer(w1,b1,x) 
A=w1*x+repmat(b1,1,size(x,2));
B=1./(1+exp(-A));
end