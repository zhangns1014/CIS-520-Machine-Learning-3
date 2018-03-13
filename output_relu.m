function A=output_relu(w1,b1,w2,b2,x)%w2 standing 
A=w2'*hiddenlayer_relu(w1,b1,x)+b2;%A lying
end
