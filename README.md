# Simple-Neural-Network-from-scratch

I implemented a feed forward neural network from scratch. 
Of course, i haven't coded all the functions possible, for instance, I only coded 4 activation functions. It's isn't complicated but it's going to add more lines and reduces the understanding (that's why i didn't do it) 

## Here some features :

- choose the number of hidden layer and neurons
- add l2 or l1 regularization
- loss : mse or mae
- drop : dropout and dropconnect
- learning rate decay
- some weight initializers : random normal, random uniform, random, zeros, ones, lecun_uniform, truncated_normal
- 4 activation functions : sigmoid, relu, tanh and elu


## TODO :

- add minibatch and rmsprop optimizer
- add gaussian noise
- add constraint (max norm for the weights)
- add softmax activation, leakyrelu, and selu
- add function hot encode vector ex (1 -> [0,1], and , 0 -> [0,0])


## Analytics :

- with or without initializer
- with or without bias
- with or without constraint
- the impact of l1,l2 regularization
