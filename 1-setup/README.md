# MySQL Installation Guide

This guide provides step-by-step instructions on how to install MySQL on different operating systems: Mac, Ubuntu, and Windows.

## Mac

### Using Homebrew

1. Open your Terminal.

2. Install Homebrew if you haven't already:

    ```bash
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    ```

3. Install MySQL using Homebrew:

    ```bash
    brew install mysql
    ```

4. Start MySQL service:

    ```bash
    brew services start mysql
    ```

### Using MySQL Installer

1. Download the MySQL Community Server installer for macOS from the official website: [MySQL Downloads](https://dev.mysql.com/downloads/mysql/).

2. Run the installer package and follow the installation wizard's instructions.

3. During installation, set up a root password for MySQL.

4. Start MySQL service using the following command:

    ```bash
    sudo mysql.server start
    ```

## Ubuntu

### Using APT Package Manager

1. Open your Terminal.

2. Update the package list:

    ```bash
    sudo apt update
    ```

3. Install MySQL Server:

    ```bash
    sudo apt install mysql-server
    ```

4. During the installation, you'll be prompted to set a root password for MySQL.

5. Start the MySQL service:

    ```bash
    sudo service mysql start
    ```

### Using MySQL APT Repository

1. Visit the MySQL APT repository page: [MySQL APT Repository](https://dev.mysql.com/downloads/repo/apt/).

2. Download the repository package for Ubuntu and install it.

3. Update the package list:

    ```bash
    sudo apt update
    ```

4. Install MySQL Server:

    ```bash
    sudo apt install mysql-server
    ```

5. During the installation, you'll be prompted to set a root password for MySQL.

6. Start the MySQL service:

    ```bash
    sudo service mysql start
    ```

## Windows

1. Download the MySQL Installer for Windows from the official website: [MySQL Downloads](https://dev.mysql.com/downloads/mysql/).

2. Run the installer executable and follow the installation wizard's instructions.

3. During installation, set up a root password for MySQL.

4. Choose the components you want to install, including MySQL Server, MySQL Workbench, and other tools.

5. Once the installation is complete, start the MySQL service using the MySQL Command Line Client or MySQL Workbench.

## Verification

To verify that MySQL is installed and running, open your Terminal or Command Prompt and run the following command:

```bash
mysql -u root -p
```

You will be prompted to enter the root password you set during installation. If MySQL is successfully running, you will be logged into the MySQL command-line interface.
