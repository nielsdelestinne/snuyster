import pandas as pd
import sys
import glob

def generate_aggregated_data_file(file_paths):
    combined_df = pd.DataFrame()

    # Loop through each file path provided
    for file_path in file_paths:
        current_df = pd.read_csv(file_path)

        # Concatenate the dataframes
        combined_df = pd.concat([combined_df, current_df])

    return combined_df


workspace = sys.argv[1]
analysis_to_run = sys.argv[2]

file_pattern = f"{workspace}/results/reports/*_{analysis_to_run}.csv"
file_paths = sorted(glob.glob(file_pattern))

result = generate_aggregated_data_file(file_paths)
filename = f"{workspace}/results/reports/aggregated/{analysis_to_run}.csv"

result.to_csv(filename, index=False)
