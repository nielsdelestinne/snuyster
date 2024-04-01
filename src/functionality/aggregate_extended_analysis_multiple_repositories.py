import pandas as pd
import glob


def generate_aggregated_data_file(file_paths):
    combined_df = pd.DataFrame()

    # Loop through each file path provided
    for file_path in file_paths:
        current_df = pd.read_csv(file_path)

        # Concatenate the dataframes
        combined_df = pd.concat([combined_df, current_df])

    columns_to_check = ['commits', 'deleted', 'added']
    if all(column in combined_df.columns for column in columns_to_check):
        # Remove the 'commit' column
        combined_df.drop('commits', axis=1, inplace=True)

        # Create the 'diff' column
        combined_df['added-lines'] = combined_df['added'] - combined_df['deleted']
        # Set negative 'diff' values to 0
        combined_df['added-lines'] = combined_df['added-lines'].apply(lambda x: max(x, 0))
        combined_df['added-or-modified-lines'] = combined_df['added']
        combined_df['deleted-lines'] = combined_df['deleted']

        # Remove the 'added' columns
        combined_df.drop(['added', 'deleted'], axis=1, inplace=True)

        for col in combined_df.columns:
            if pd.api.types.is_float_dtype(combined_df[col]) and (combined_df[col].dropna().apply(float.is_integer).all()):
                combined_df[col] = combined_df[col].astype('Int64')

    return combined_df


file_pattern = "/reports/aggregated_extended_*.csv"
file_paths = sorted(glob.glob(file_pattern))

result = generate_aggregated_data_file(file_paths)
filename = "/reports/aggregated_extended.csv"

result.to_csv(filename, index=False)
