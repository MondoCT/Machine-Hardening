import os
import subprocess
import sys

def check_git_installed():
    try:
        subprocess.check_call(["git", "--version"])
    except subprocess.CalledProcessError:
        print("Git is not installed or not found in PATH. Please install Git and try again.")
        sys.exit(1)

def install_packages():
    subprocess.check_call([sys.executable, "-m", "pip", "install", "-r", "pdf-to-txt-converter/requirements.txt"])

def clone_repository():
    repo_url = "https://github.com/MondoCT/pdf-to-txt-converter.git"
    subprocess.check_call(["git", "clone", "--branch", "test", repo_url])

def run_application():
    os.chdir("pdf-to-txt-converter")
    subprocess.check_call([sys.executable, "src/main.py"])

if __name__ == "__main__":
    check_git_installed()
    if not os.path.exists("pdf-to-txt-converter"):
        clone_repository()
    install_packages()
    run_application()
