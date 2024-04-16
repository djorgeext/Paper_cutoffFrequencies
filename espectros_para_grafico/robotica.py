import numpy as np
import matplotlib.pyplot as plt

# Number of uniform random variables to generate
num_samples = 10000
# Number of uniform random variables to sum
num_uniform_vars = 12

# Generate uniform random variables
uniform_samples = np.random.rand(num_uniform_vars, num_samples)
# Sum the uniform random variables along rows
sum_uniform = np.sum(uniform_samples, axis=0)

# Normalize the sum to obtain standard normal distribution
mean = num_uniform_vars / 2.0  # mean of the sum of uniform variables
std_dev = np.sqrt(num_uniform_vars / 12.0)  # standard deviation of the sum of uniform variables
normal_samples = (sum_uniform - mean) / std_dev

# Plot the histogram of the generated normal distribution
plt.hist(normal_samples, bins=1000, density=True, color='skyblue', edgecolor='black')
plt.title('Histogram of Normal Distribution')
plt.xlabel('Value')
plt.ylabel('Density')
plt.grid(True)
plt.show()