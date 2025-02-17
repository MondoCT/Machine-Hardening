import tkinter as tk
import subprocess
import os

def run_script(script_name):
    try:
        subprocess.run(['python3', script_name], check=True)
    except subprocess.CalledProcessError as e:
        print(f"Failed to run {script_name}: {e}")

def create_button(frame, text, script_name):
    button = tk.Button(frame, text=text, command=lambda: run_script(script_name))
    button.pack(fill=tk.X, padx=5, pady=5)

def main():
    # Set up virtual display
    os.environ['DISPLAY'] = ':1'
    subprocess.run(['Xvfb', ':1', '-screen', '0', '1024x768x16'], check=True)

    root = tk.Tk()
    root.title("Browser Hardening")

    frame = tk.Frame(root)
    frame.pack(padx=10, pady=10)

    # Buttons for scripts
    create_button(frame, "Run Chrome Hardening Script", "chrome.py")
    create_button(frame, "Run Chrome Hardening Script (Confirmation)", "chrome_ask.py")
    create_button(frame, "Run Edge Hardening Script", "edge.py")
    create_button(frame, "Run Edge Hardening Script (Confirmation)", "edge_ask.py")

    root.mainloop()

if __name__ == "__main__":
    main()
