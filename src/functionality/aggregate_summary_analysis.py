import pandas as pd


def generate_aggregated_data_file(file_paths, analysis_mode):
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
    combined_df.to_csv(f'/reports/aggregated_{analysis_mode}.csv')


import glob

analysis_mode = "summary"
file_pattern = f'/reports/*_{analysis_mode}.csv'
file_paths = sorted(glob.glob(file_pattern))

generate_aggregated_data_file(file_paths, analysis_mode)