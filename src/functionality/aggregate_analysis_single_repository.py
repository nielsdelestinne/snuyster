import pandas as pd
import sys

analysis_to_run = sys.argv[1]
repository = sys.argv[2]

file_path = f'../../reports/{repository}_{analysis_to_run}.csv'

df = pd.read_csv(file_path)
df['repository'] = repository

df.to_csv(file_path, index=False)
