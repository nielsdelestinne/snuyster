import glob
import sys

import matplotlib.pyplot as plt
import numpy as np
import pandas as pd

def load_csv(file_path):
    # Reads CSV into a dataframe and returns it
    return pd.read_csv(file_path)

def generate_aggregated_data_file(workspace, file_paths, analysis_mode):
    # Initialize an empty DataFrame to store the combined data
    combined_df = pd.DataFrame()

    # Loop through each repository
    for path in file_paths:
        repository_name = path.split('/')[-1].replace(f'_{analysis_mode}', '').replace('.csv', '')

        # Read the CSV file for the current repository
        df = pd.read_csv(path).head(4)

        # Transpose the DataFrame and set the first row as the header
        df_transposed = df.T
        df_transposed.columns = df_transposed.iloc[0]  # Set first row as column names
        df_transposed = df_transposed.drop(df_transposed.index[0])  # Drop the first row

        # Add a column for the repository name (assuming the repository variable contains the name)
        df_transposed['repository'] = repository_name

        # Append the transposed DataFrame to the combined DataFrame
        combined_df = pd.concat([combined_df, df_transposed], ignore_index=True)

    # Set the 'repository' column as the index if desired
    combined_df.set_index('repository', inplace=True)

    # Save the combined DataFrame as a CSV file
    combined_df.to_csv(f'{workspace}/results/reports/aggregated/{analysis_mode}.csv')


def plot(df):
    # Identify metrics columns (assuming the first column is always the service name)
    metrics = df.columns[1:]

    # Determine the number of subplot rows/columns needed
    n_metrics = len(metrics)
    n_rows = (n_metrics + 1) // 2  # Ensuring enough rows to fit all metrics
    n_cols = 2 if n_metrics > 1 else 1  # Use 2 columns if more than one metric, else just 1

    # Creating a color for each service
    cmap1 = plt.cm.tab20
    colors = cmap1(np.linspace(0, 1, len(df['repository'])))

    # Set the figure size dynamically based on the number of metrics
    plt.figure(figsize=(10 * n_cols, 5 * n_rows))

    # Generate a plot for each metric
    for i, metric in enumerate(metrics):
        plt.subplot(n_rows, n_cols, i + 1)
        for j, service in enumerate(df['repository']):
            bar = plt.barh(service, df[metric][j], color=colors[j])
            plt.bar_label(bar, color='black', fontsize=7)
        plt.tick_params(axis='y', labelsize=7)
        plt.xlabel(metric.replace('-', ' ').capitalize())
        plt.title(metric.replace('-', ' ').capitalize() + ' per Repository')

    plt.tight_layout()
    plt.show()


workspace=sys.argv[1]
analysis_mode = "summary"
file_pattern = f'{workspace}/results/reports/*_{analysis_mode}.csv'
file_paths = sorted(glob.glob(file_pattern))

generate_aggregated_data_file(workspace, file_paths, analysis_mode)

# Load the CSV file
csv_file_path = f'{workspace}/results/reports/aggregated/{analysis_mode}.csv'
df = load_csv(csv_file_path)
plot(df)
