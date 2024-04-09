import pandas as pd
import sys


def merge_csv_files(file_paths, repository):
    merged_df = None

    # Loop through each file path provided
    for file_path in file_paths:
        # Read the current file into a DataFrame
        current_df = pd.read_csv(file_path)

        # If the merged_df is not initialized, assign current_df to it directly
        if merged_df is None:
            merged_df = current_df
        else:
            # Merge the current dataframe with the merged_df on the 'entity' column
            merged_df = pd.merge(merged_df, current_df, on='entity', how='outer')

    # Convert columns that were originally integer but turned into floats back to integers using Int64 dtype
    for col in merged_df.columns:
        if pd.api.types.is_float_dtype(merged_df[col]) and (merged_df[col].dropna().apply(float.is_integer).all()):
            merged_df[col] = merged_df[col].astype('Int64')

    # Add column repository containing the service name in each row
    merged_df['repository'] = repository

    return merged_df


def generate_file_paths(workspace, analyses, repository):
    file_paths = []
    for analysis in analyses:
        file_paths.append(f"{workspace}/reports/{repository}_{analysis}.csv")
    return file_paths


analyses = ['age', 'soc', 'entity-churn', 'revloc']
workspace = sys.argv[1]
repository = sys.argv[2]

merged_df = merge_csv_files(generate_file_paths(workspace, analyses, repository), repository)

merged_df.to_csv(f"{workspace}/reports/aggregated/extended_{repository}.csv", index=False)
