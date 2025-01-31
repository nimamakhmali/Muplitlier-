import numpy as np
import matplotlib.pyplot as plt

def dadda_multiplier(a, b, bit_size, approx=False):

    result = a * b  
    
    if approx:

        error_mask = (1 << (bit_size // 4)) - 1  
        error = np.random.randint(0, error_mask)  
        result = (result & ~error_mask) + error  

    return result

def evaluate_dadda_multiplier(bit_sizes, num_samples=5000, approx=True):
    
    results = {}

    for bit_size in bit_sizes:
        true_values = []
        approx_values = []

        for _ in range(num_samples):
            a = np.random.randint(0, 2**bit_size) 
            b = np.random.randint(0, 2**bit_size)  
            
            true_value = dadda_multiplier(a, b, bit_size, approx=False)
            approx_value = dadda_multiplier(a, b, bit_size, approx=True)
            
            true_values.append(true_value)
            approx_values.append(approx_value)

        true_values = np.array(true_values)
        approx_values = np.array(approx_values)

        mse = np.mean((true_values - approx_values) ** 2)
        mae = np.mean(np.abs(true_values - approx_values))

        results[bit_size] = (mse, mae, true_values, approx_values)

        print(f"\n🔹 {bit_size}-bit Multiplier:")
        print(f"   - MSE: {mse}")
        print(f"   - MAE: {mae}")

    return results

def plot_results(results):
    
    plt.figure(figsize=(12, 6))

    for bit_size, (mse, mae, true_values, approx_values) in results.items():
        plt.subplot(1, 2, 1)
        plt.bar(bit_size, mse, label=f"{bit_size}-bit")
        plt.xlabel("Bit Size")
        plt.ylabel("MSE")
        plt.title("Mean Squared Error (MSE)")

        plt.subplot(1, 2, 2)
        plt.bar(bit_size, mae, label=f"{bit_size}-bit")
        plt.xlabel("Bit Size")
        plt.ylabel("MAE")
        plt.title("Mean Absolute Error (MAE)")

    plt.legend()
    plt.tight_layout()
    plt.show()



bit_sizes = [4, 8, 16, 32]
results = evaluate_dadda_multiplier(bit_sizes, num_samples=5000, approx=True)

plot_results(results)
