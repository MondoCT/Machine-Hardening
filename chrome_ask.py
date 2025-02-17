import os
import subprocess
import shutil

def ask_user(prompt):
    """Ask the user for a yes or no response."""
    while True:
        response = input(f"{prompt} (yes/no): ").strip().lower()
        if response in ['yes', 'no']:
            return response == 'yes'
        print("Please respond with 'yes' or 'no'.")

def update_chrome():
    """Update Google Chrome to the latest version."""
    if ask_user("Do you want to update Google Chrome?"):
        try:
            subprocess.run(['sudo', 'apt-get', 'update'], check=True)
            subprocess.run(['sudo', 'apt-get', '--only-upgrade', 'install', 'google-chrome-stable'], check=True)
            print("Google Chrome updated successfully.")
        except subprocess.CalledProcessError as e:
            print(f"Failed to update Google Chrome: {e}")

def clear_browsing_data():
    """Clear Google Chrome browsing data."""
    if ask_user("Do you want to clear Google Chrome browsing data?"):
        chrome_cache_path = os.path.expanduser('~/.cache/google-chrome/')
        try:
            shutil.rmtree(chrome_cache_path)
            print("Browsing data cleared successfully.")
        except FileNotFoundError:
            print("No browsing data found to clear.")
        except Exception as e:
            print(f"Failed to clear browsing data: {e}")

def set_security_preferences():
    """Set Google Chrome security preferences."""
    if ask_user("Do you want to set Google Chrome security preferences?"):
        preferences_path = os.path.expanduser('~/.config/google-chrome/Default/Preferences')
        try:
            with open(preferences_path, 'r+') as file:
                preferences = file.read()
                # Modify preferences as needed
                # Example: Enable Safe Browsing
                preferences = preferences.replace('"safebrowsing":{"enabled":false', '"safebrowsing":{"enabled":true')
                file.seek(0)
                file.write(preferences)
                file.truncate()
            print("Security preferences set successfully.")
        except FileNotFoundError:
            print("Preferences file not found.")
        except Exception as e:
            print(f"Failed to set security preferences: {e}")

def main():
    update_chrome()
    clear_browsing_data()
    set_security_preferences()

if __name__ == "__main__":
    main()