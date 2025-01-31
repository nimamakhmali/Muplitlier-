import numpy as np
import matplotlib.pyplot as plt

def dadda_multiplier(a, b):

    result = a * b
    error = np.random.randint(0, 10)  
    return result + error

num_samples = 1000

true_values = []
approx_values = []

for _ in range(num_samples):
    a = np.random.randint(0, 16)  
    b = np.random.randint(0, 16)  
    true_value = a * b
    approx_value = dadda_multiplier(a, b)
    
    true_values.append(true_value)
    approx_values.append(approx_value)

true_values = np.array(true_values)
approx_values = np.array(approx_values)


mse = np.mean((true_values - approx_values) ** 2)

mae = np.mean(np.abs(true_values - approx_values))

print(f"MSE: {mse}")
print(f"MAE: {mae}")

plt.figure(figsize=(10, 6))

plt.subplot(1, 2, 1)
plt.hist(true_values - approx_values, bins=30, color='blue', alpha=0.7, label='Error')
plt.title('Error Distribution (MSE)')
plt.xlabel('Error')
plt.ylabel('Frequency')
plt.legend()

plt.subplot(1, 2, 2)
plt.plot(true_values, approx_values, 'ro', markersize=2, label='Approximate Results')
plt.title('Approximate vs True Values (MAE)')
plt.xlabel('True Values')
plt.ylabel('Approximate Values')
plt.legend()

plt.tight_layout()
plt.show()
