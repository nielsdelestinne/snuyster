import pandas as pd
import sys

workspace = sys.argv[1]
analysis_to_run = sys.argv[2]
repository = sys.argv[3]

file_path = f'{workspace}/reports/{repository}_{analysis_to_run}.csv'

df = pd.read_csv(file_path)
df['repository'] = repository

df.to_csv(file_path, index=False)
