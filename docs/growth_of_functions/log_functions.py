import numpy as np
import matplotlib.pyplot as plt

def plot_log_n():
    # Create input sizes from 1 to 100
    n = np.arange(1, 101)

    # Calculate logarithmic growth function
    log_n = np.log2(n)  # lg n (logarithm base 2)

    # Create figure
    fig, axes = plt.subplots(1, 1, figsize=(10, 6))
    fig.suptitle(
        'Logarithmic Growth Function (lg n)',
        fontsize=16,
        fontweight='bold'
    )

    # Plot log n function
    axes.plot(n, log_n, label='lg n (Binary Search)', color='green', linewidth=2.5, linestyle='-', marker='o', markevery=10, markersize=5)

    # Add labels and title
    axes.set_xlabel('Input Size (n)', fontsize=12, fontweight='bold')
    axes.set_ylabel('Operations (lg n)', fontsize=12, fontweight='bold')
    axes.set_title('Logarithmic Time Complexity - O(log n)', fontsize=14, pad=20)

    # Add legend
    axes.legend(loc='upper left', fontsize=11, framealpha=0.9)

    # Add grid for better readability
    axes.grid(True, alpha=0.3, linestyle='--', linewidth=0.5)

    # Set axis limits for better visualization
    axes.set_xlim(1, 100)
    axes.set_ylim(0, max(log_n) * 1.2)  # Add 20% padding at top

    # Add annotation highlighting efficiency
    axes.text(50, log_n[49] + 0.3, '  Very efficient!\n  Grows slowly', fontsize=10, color='green',
              verticalalignment='bottom', fontweight='bold')

    # Adjust layout
    plt.tight_layout()

    return fig


def plot_log_n_comparison():
    """Create a comparison plot with both linear and log scale"""
    n = np.arange(1, 101)

    # Calculate different growth functions
    log_n = np.log2(n)
    linear_n = n
    n_log_n = n * np.log2(n)
    n_squared = n ** 2
    n_cubed = n ** 3

    # Create figure with two subplots
    fig, (ax1, ax2) = plt.subplots(1, 2, figsize=(16, 6))
    fig.suptitle('Growth Functions: Linear vs Logarithmic Scale', fontsize=16, fontweight='bold')

    # Linear scale plot
    ax1.plot(n, log_n, label='lg n', linewidth=2)
    ax1.plot(n, linear_n, label='n', linewidth=2)
    ax1.plot(n, n_log_n, label='n lg n', linewidth=2)
    ax1.plot(n, n_squared, label='n²', linewidth=2)
    ax1.plot(n, n_cubed, label='n³', linewidth=2)
    ax1.set_xlabel('Input Size (n)', fontsize=11, fontweight='bold')
    ax1.set_ylabel('Operations', fontsize=11, fontweight='bold')
    ax1.set_title('Linear Scale', fontsize=12)
    ax1.legend(fontsize=10)
    ax1.grid(True, alpha=0.3)

    # Logarithmic scale plot
    ax2.plot(n, log_n, label='lg n', linewidth=2)
    ax2.plot(n, linear_n, label='n', linewidth=2)
    ax2.plot(n, n_log_n, label='n lg n', linewidth=2)
    ax2.plot(n, n_squared, label='n²', linewidth=2)
    ax2.plot(n, n_cubed, label='n³', linewidth=2)
    ax2.set_xlabel('Input Size (n)', fontsize=11, fontweight='bold')
    ax2.set_ylabel('Operations (log scale)', fontsize=11, fontweight='bold')
    ax2.set_title('Logarithmic Scale', fontsize=12)
    ax2.set_yscale('log')
    ax2.legend(fontsize=10)
    ax2.grid(True, alpha=0.3, which='both')

    plt.tight_layout()
    return fig


if __name__ == "__main__":
    # Create and display the main plot
    print("Generating growth functions visualization...")
    fig1 = plot_log_n()

    # Create and display the comparison plot
    # fig2 = plot_log_n_comparison()
    #
    # # Save plots
    # fig1.savefig('docs/growth_of_functions/growth_functions.png', dpi=300, bbox_inches='tight')
    # fig2.savefig('docs/growth_of_functions/growth_comparison.png', dpi=300, bbox_inches='tight')
    #
    # print("Plots saved successfully!")
    # print("- growth_functions.png")
    # print("- growth_comparison.png")

    # Display the plots
    plt.show()
