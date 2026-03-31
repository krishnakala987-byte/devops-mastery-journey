import os
from datetime import datetime

# Path where volume will be mounted
DATA_DIR = "/app/data"
FILE_PATH = os.path.join(DATA_DIR, "log.txt")

# Ensure directory exists
os.makedirs(DATA_DIR, exist_ok=True)

# Write data to file
with open(FILE_PATH, "a") as f:
    f.write(f"Log entry at {datetime.now()}\n")

print("Data written to volume successfully.")
