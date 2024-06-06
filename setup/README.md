# MySQL Installation

This guide provides step-by-step instructions on how to install MySQL on different operating systems: Mac, Ubuntu, and Windows.

## My SQL

### Mac

#### Using Homebrew

1. Open your Terminal.

2. Install Homebrew if you haven't already:

```bash
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

3. Install MySQL using Homebrew:

```bash
$ brew install mysql
```

4. Start MySQL service:

```bash
$ brew services start mysql
```

> [!TIP]
> If you install MySQL by Homebrew, the default username is `root`, and there is no password.

### Ubuntu

#### Using APT Package Manager

1. Open your Terminal.

2. Update the package list:

```bash
$ sudo apt update
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

#### Using MySQL APT Repository

1. Visit the MySQL APT repository page: [MySQL APT Repository](https://dev.mysql.com/downloads/repo/apt/).

2. Download the repository package for Ubuntu and install it.

3. Update the package list:

```bash
$ sudo apt update
```

4. Install MySQL Server:

```bash
$ sudo apt install mysql-server
```

5. During the installation, you'll be prompted to set a root password for MySQL.

6. Start the MySQL service:

```bash
$ sudo service mysql start
```

### Windows

1. Download the MySQL Installer for Windows from the official website: [MySQL Downloads](https://dev.mysql.com/downloads/mysql/).

2. Run the installer executable and follow the installation wizard's instructions.

3. During installation, set up a root password for MySQL.

4. Choose the components you want to install. Select *at least* MySQL Server.

5. Once the installation is complete, start the MySQL service using the MySQL Command Line Client or MySQL Workbench.

> [!IMPORTANT]
> Store the password you chose in a secure but handy place. You're going to need it throughout the module.

## Verification

To verify that MySQL is installed and running, open your Terminal or Command Prompt and run the following command:

```bash
$ mysql -u root -p
```

You will be prompted to enter the root password you set during installation. If MySQL is successfully running, you will be logged into the MySQL command-line interface.

## DBeaver

You can interact with a MySQL database directly from your terminal using the `mysql` shell. However, it's more convenient to use a separate application - a SQL client. 

DBeaver is a free, open source SQL client that works on macOS, Linux, and Windows that supports MySQL and many others SQL database engines. We recommend installing and using it during the module.

### macOS and Windows

1. Go to [DBeaver's Download page](https://dbeaver.io/download/)
1. Choose your OS and download the respective installer.
1. Open the installer and follow the instructions.

### Ubuntu

1. Add DBeaver to your list of repositories

```bash
$ sudo add-apt-repository ppa:serge-rider/dbeaver-ce
```

2. Update your package list

```bash
$ sudo apt-get update
```

3. Install DBeaver

```bash
$ sudo apt-get install dbeaver-ce
```