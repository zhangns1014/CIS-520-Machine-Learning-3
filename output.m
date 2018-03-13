function A=output(w1,b1,w2,b2,x)%w2 standing 
A=w2'*hiddenlayer(w1,b1,x)+b2;%A lying
end
