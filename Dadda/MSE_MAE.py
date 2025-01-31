import numpy as np
import matplotlib.pyplot as plt

def approximate_multiplier(a, b, bit_width):

  
    exact_result = a * b
    error = np.random.randint(-2**(bit_width-3), 2**(bit_width-3))  
    approx_result = exact_result + error
    return exact_result, approx_result

def calculate_errors(bit_width, num_samples=1000):

    errors = []
    exact_values = []
    approx_values = []

    for _ in range(num_samples):
        a = np.random.randint(0, 2**bit_width)
        b = np.random.randint(0, 2**bit_width)
        
        exact, approx = approximate_multiplier(a, b, bit_width)
        
        exact_values.append(exact)
        approx_values.append(approx)
        errors.append(abs(exact - approx))

    mse = np.mean(np.square(errors))
    mae = np.mean(errors)
    
    return exact_values, approx_values, errors, mse, mae

def plot_results(bit_widths, num_samples=1000):

    mse_values = []
    mae_values = []
    
    for bit_width in bit_widths:
        exact_values, approx_values, errors, mse, mae = calculate_errors(bit_width, num_samples)
        
        mse_values.append(mse)
        mae_values.append(mae)
        
        plt.figure(figsize=(6, 4))
        plt.scatter(exact_values, approx_values, alpha=0.5, label="Approx vs Exact", color="blue")
        plt.plot([min(exact_values), max(exact_values)], [min(exact_values), max(exact_values)], 'r--', label="Ideal")
        plt.xlabel("Exact Value")
        plt.ylabel("Approximate Value")
        plt.title(f"Scatter Plot - {bit_width}-bit Approximate Multiplier")
        plt.legend()
        plt.grid()
        plt.show()
        
        plt.figure(figsize=(6, 4))
        plt.hist(errors, bins=30, color="purple", alpha=0.7)
        plt.xlabel("Absolute Error")
        plt.ylabel("Frequency")
        plt.title(f"Error Distribution - {bit_width}-bit Multiplier")
        plt.grid()
        plt.show()

        plt.figure(figsize=(6, 4))
        plt.bar([f"{bit_width}-bit"], [mse], color="red")
        plt.ylabel("MSE")
        plt.title(f"MSE for {bit_width}-bit Multiplier")
        plt.grid()
        plt.show()


        plt.figure(figsize=(6, 4))
        plt.bar([f"{bit_width}-bit"], [mae], color="blue")
        plt.ylabel("MAE")
        plt.title(f"MAE for {bit_width}-bit Multiplier")
        plt.grid()
        plt.show()

bit_widths = [4, 6, 8]
plot_results(bit_widths)
