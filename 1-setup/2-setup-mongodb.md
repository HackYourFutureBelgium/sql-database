# Set up

## Installing mongosh

### For Windows:

1. Visit the MongoDB Download Center (https://www.mongodb.com/try/download/shell) and scroll down to the "MongoDB Shell" section.

2. Choose the version of MongoDB Shell that matches your system architecture (32-bit or 64-bit) and click the "Download" button.

3. Run the downloaded installer and follow the installation wizard.

4. After installation, you can open the MongoDB Shell by running "mongosh" in the command prompt or PowerShell.

### For Mac (using Homebrew):

1. Open the Terminal.

2. Run the following command to install mongosh using Homebrew:

    ```
    brew tap mongodb/brew
    brew install mongosh
    ```

3. Once the installation is complete, you can run "mongosh" from the terminal to start using it.

### For Ubuntu:

1. Open the Terminal.

2. Add the MongoDB repository to your sources list by running:

    ```
    echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/5.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-5.0.list
    ```

    Make sure to replace "focal" with your Ubuntu version if it's different.

3. Update the package list with:

    ```
    sudo apt update
    ```

4. Install mongosh with:

    ```
    sudo apt install -y mongosh
    ```

5. You can start the MongoDB Shell by running "mongosh" in the terminal.

## Installing MongoDB Compass:

### For Windows and Mac:

1. Visit the MongoDB Download Center (https://www.mongodb.com/try/download/compass) and scroll down to the "MongoDB Compass" section.

2. Choose the version of MongoDB Compass for your operating system.

3. Download the installer and run it.

4. Follow the installation wizard to install MongoDB Compass.

### For Ubuntu:

1. Visit the MongoDB Download Center (https://www.mongodb.com/try/download/compass) and scroll down to the "MongoDB Compass" section.

2. Choose the version of MongoDB Compass for Linux.

3. Download the .tar.gz file.

4. Open the terminal and navigate to the directory where the downloaded file is located.

5. Extract the archive with the following command (replace "mongodb-compass" with the actual file name):

    ```
    tar -xvzf mongodb-compass*.tar.gz
    ```

6. Move the extracted folder to a location of your choice:

    ```
    mv mongodb-compass* ~/mongodb-compass
    ```

7. You can run MongoDB Compass by executing the "mongodb-compass" binary located in the extracted folder.
