import os
import sys
import subprocess
from dotenv import load_dotenv

print('Starting WhisperWriter...')
load_dotenv(override=True)
subprocess.run([sys.executable, os.path.join('src', 'main.py')])
