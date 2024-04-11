# function for creating a perceptron
# sigmoid activation function
def sigmoid(x):
    return 1 / (1 + np.exp(-x))
# derivative of sigmoid function
def sigmoid_derivative(x):
    return x * (1 - x)

# tanh activation function
def tanh(x):
    return np.tanh(x)
# derivative of tanh function
def tanh_derivative(x):
    return 1 - x ** 2

# ReLU activation function
def relu(x):
    return np.maximum(0, x)
# derivative of ReLU function
def relu_derivative(x):
    return 1 if x > 0 else 0

def perceptron(input_dimension, output_dimension, layer_dimensions, activation_function, input_pattern, output_pattern, eta):
    
    if len(layer_dimensions) == 1:
        w = np.random.rand(input_dimension)
        b = np.random.rand(input_dimension)
        z = np.zeros(input_pattern[:,0].size)
    
    
    w = {}
    b = {}
    if len(layer_dimensions) == 1:
        for i in range(output_dimension):
            w[i] = np.random.rand(input_dimension)
            b[i] = np.random.rand()