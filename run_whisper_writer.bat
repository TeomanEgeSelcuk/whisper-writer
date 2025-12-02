@echo off
cd C:\Users\maste\OneDrive\Desktop\All-Desktop-Files\coding\whisper-writer

REM Initialize conda for batch scripts
call C:\Users\maste\anaconda3\Scripts\activate.bat
call conda init cmd.exe >nul 2>&1

REM Check if conda environment exists, if not create it
conda info --envs | findstr whisper-writer-env >nul
if errorlevel 1 (
    echo Creating conda environment whisper-writer-env with Python 3.11...
    conda create -n whisper-writer-env python=3.11 -y
)

REM Activate the conda environment
call conda activate whisper-writer-env

REM Check if requirements are installed by trying to import a key package
python -c "import PyQt5" 2>nul
if errorlevel 1 (
    echo Installing requirements...
    echo Installing conda packages for better compatibility...
    conda install -c conda-forge cffi pyqt -y
    pip install -r requirements.txt
)

REM Run the application
python run.py
