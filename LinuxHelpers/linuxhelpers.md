# Linux Cheat Sheet for Basic Tasks

## Updating from the shell

[Updating Linux commands-forum](https://askubuntu.com/questions/196768/how-to-install-updates-via-command-line)

``` bash
    sudo apt-get update         # Fetches list of available updates
    sudo apt-get upgrade        # Strictly upgrades the current packages
    sudo apt-get dist-upgrade   # Installs updates (new ones)
```

## Random MarkDown

[Github Flavored MarkDown Documentation](https://github.github.com/gfm/#links)

## Install PowerShell Core on Linux

``` bash
# Import the public repository GPG keys
curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -

# Register the Microsoft Ubuntu repository
curl https://packages.microsoft.com/config/ubuntu/16.04/prod.list | sudo tee /etc/apt/sources.list.d/microsoft.list

# Update apt-get
sudo apt-get update

# Install PowerShell
sudo apt-get install -y powershell

# Start PowerShell
powershell
```