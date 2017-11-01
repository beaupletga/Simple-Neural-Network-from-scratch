import numpy as np
import matplotlib.pyplot as plt
np.random.seed(1)

def sigmoid(x):
    return 1/(1+np.exp(-x))

def sigmoid_derivative(x):
    return x*(1-x)

def mse(y_pred,y_true):
    return 0.5*(y_pred-y_true)**2

def mse_derivative(y_pred,y_true):
    return y_pred*(y_pred-y_true)

class Layer(object):

    def __init__(self,int nb_neurons,last_layer=False,prev_result=None):
        self.nb_neurons=nb_neurons
        self.last_layer=last_layer
        self.weights=2*np.random.rand(prev_result.shape[1],nb_neurons)-1
        self.bias=2*np.random.rand()-1
        self.prev_result=prev_result
        self.out_shape=(prev_result.shape[0],nb_neurons)
        self.out=np.zeros(self.out_shape)

    def forward(self,prev_result):
        self.prev_result=prev_result
        self.out=sigmoid(self.prev_result.dot(self.weights)+self.bias)
        return self.out

    def backward(self,delta,output=None):
        if self.last_layer==True:
            self.weights-=learning_rate*self.prev_result.T.dot(delta)
            self.bias-=learning_rate*np.mean(delta)
        else:
            # print self.prev_result.T.shape,delta.shape,output.weights.T.shape,self.out.shape
            # print self.weights.shape
            delta=delta.dot(output.weights.T)*sigmoid_derivative(self.out)
            self.weights-=learning_rate*self.prev_result.T.dot(delta)
            self.bias-=learning_rate*np.mean(delta)
            return delta

x=np.array(([0,0],[0,1],[1,0],[1,1]))
y=np.array(([0,1,1,0])).T.reshape((-1,1))
learning_rate=1e-1

#stacking each layer
#index
#for the first layer, prev_result is x. For the others it's prev_layer.out
dense1=Layer(nb_neurons=10,prev_result=x)
dense2=Layer(nb_neurons=6,prev_result=dense1.out)
output=Layer(nb_neurons=1,last_layer=True,prev_result=dense2.out)
error_list=[]

cdef int i
for i in range(0,10000):
    #need the result of the previous layer
    a=dense1.forward(x)
    b=dense2.forward(a)
    output.forward(b)

    error=np.mean(mse(output.out,y))
    error_list.append(error)
    delta=mse_derivative(output.out,y)*sigmoid_derivative(output.out)

    output.backward(delta)
    delta=dense2.backward(delta,output)
    dense1.backward(delta,dense2)

plt.plot(error_list)
plt.show()
