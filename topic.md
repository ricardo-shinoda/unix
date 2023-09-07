## Unix Architecture and Common Folders
​
### What is Unix?
​
Unix is a powerful and versatile operating system commonly used in servers, workstations, and embedded systems. It's known for its stability, security, and flexibility. One of the defining features of Unix-like systems is the use of a shell, a command-line interface that allows users to interact with the system using text-based commands.
​
### Unix Directory Structure
​
Unix systems have a hierarchical file system structure. Here are some of the most common directories and their purposes:
​
1. **/ (Root Directory):** The top-level directory from which all other directories branch. It contains the entire file system.
2. **/bin (Binary):** Stores essential system binaries (executable files) needed for system recovery and maintenance.
3. **/boot:** Contains files required for the system's boot process, including the kernel and bootloader configuration.
4. **/dev (Device):** Contains device files representing hardware devices like disks, keyboards, and printers.
5. **/etc (Etcetera):** Houses system-wide configuration files, including startup scripts and network configuration files.
6. **/home:** Home directories for individual users are located here. Each user typically has a subdirectory with their username.
7. **/lib (Library):** Essential system libraries are stored here. These libraries are necessary for running programs and the system itself.
8. **/mnt (Mount):** Used for temporarily mounting external storage devices such as USB drives and network shares.
9. **/opt (Optional):** Contains optional software packages and applications installed by the system administrator.
10. **/tmp (Temporary):** Stores temporary files that are deleted upon reboot. It's accessible to all users.
11. **/usr (User):** Contains user-related programs, libraries, documentation, and other non-essential files.
12. **/var (Variable):** Holds variable data files, including log files, mail spools, and printer queues.
​
## File Users and Ownership
​
In Unix-like systems, each file and directory is associated with an owner and a group. Understanding ownership is crucial because it determines who can access and modify files.
​
1. **User (Owner):** The user who originally created the file or directory is its owner. The owner can modify or delete the file and change its permissions.
2. **Group:** Each user belongs to one or more groups. A file can be associated with a group, and all users in that group have certain permissions on the file.
​
## File Permissions
​
File permissions determine who can read, write, or execute a file or directory. There are three basic permission types:
​
1. **Read (r):** Allows the user to view the file's contents. For directories, it permits listing the directory's contents.
2. **Write (w):** Allows the user to modify or delete the file. For directories, it permits creating, deleting, and renaming files within the directory.
3. **Execute (x):** Allows the user to run a program or script if it's an executable file. For directories, it permits accessing the contents of the directory.
​
### Viewing File Permissions
​
You can use the `ls` command with the `-l` flag to view file permissions. Here's an example:
​
```
bashCopy code
$ ls -l myfile.txt
-rw-r--r-- 1 user users 1024 Sep 6 14:00 myfile.txt
```
​
In this example:
​
- `rw-` indicates that the owner can read and write the file.
- `r--` indicates that the group can only read the file.
- `r--` also indicates that others (users not in the owner's group) can only read the file.
​
### Modifying File Permissions
​
The `chmod` command is used to change file permissions. It can be used in two ways:
​
1. **Symbolic Mode:** Modifying permissions using symbols like `+`, `-`, and `=`.
​
   For example, to add execute permission to a file for the owner:
​
   ```
   bashCopy code
   $ chmod u+x myfile.txt
   ```
​
2. **Numeric Mode:** Modifying permissions using numeric values.
​
   - `4` represents read permission.
   - `2` represents write permission.
   - `1` represents execute permission.
​
   For example, to give read and write permissions to the owner and read-only to the group:
​
   ```shell
   bashCopy code
   $ chmod 644 myfile.txt
   ```
​
### Changing File Owners and Groups
​
The `chown` command changes the file owner, and the `chgrp` command changes the group ownership. Both commands require administrative privileges.
​
To change the owner of a file:
​
```
$ sudo chown newuser myfile.txt
```
​
To change the group of a file:
​
```
$ sudo chgrp newgroup myfile.txt
```
​
## File and Directory Management
​
1. **ls (List):** Lists files and directories in the current directory.
​
   ```
   $ ls
   ```
​
2. **cd (Change Directory):** Navigates to a different directory.
​
   ```
   $ cd /path/to/directory
   ```
​
3. **pwd (Print Working Directory):** Displays the current directory.
​
   ```
   $ pwd
   ```
​
4. **mkdir (Make Directory):** Creates a new directory.
​
   ```
   $ mkdir new_directory
   ```
​
5. **cp (Copy):** Copies files or directories.
​
   ```
   $ cp file.txt new_location/
   ```
​
6. **mv (Move/Rename):** Moves files or directories to a new location or renames them.
​
   ```
   $ mv old_file.txt new_name.txt
   ```
​
7. **rm (Remove):** Deletes files or directories. Use with caution.
​
   ```
   $ rm file.txt
   ```
​
8. **touch:** Creates an empty file or updates the timestamp of an existing one.
​
   ```
   $ touch new_file.txt
   ```
​
## Text Processing
​
1. **cat (Concatenate):** Displays the contents of a text file.
​
   ```
   $ cat file.txt
   ```
​
2. **more/less:** Display large text files one page at a time.
​
   ```
   $ more file.txt
   $ less file.txt
   ```
​
3. **head/tail:** Display the beginning or end of a file.
​
   ```
   $ head -n 10 file.txt
   $ tail -n 10 file.txt
   ```
​
4. **grep (Global Regular Expression Print):** Searches for text patterns in files.
​
   ```
   $ grep "pattern" file.txt
   ```
​
5. **sed (Stream Editor):** Edits text using a script or set of commands.
​
   ```
   $ sed 's/old/new/g' file.txt
   ```
​
## System Information
​
1. **date:** Display the current date and time.
​
   ```
   $ date
   ```
​
2. **df (Disk Free):** Shows disk space usage.
​
   ```
   $ df -h
   ```
​
3. **free:** Displays system memory usage.
​
   ```
   $ free -m
   ```
​
4. **top/htop:** Provides real-time system performance information.
​
   ```
   $ top
   ```
​
## User and Permissions
​
1. **who:** Shows who is currently logged in.
​
   ```
   $ who
   ```
​
2. **chmod (Change Mode):** Changes file permissions.
​
   ```
   $ chmod 644 file.txt
   ```
​
3. **chown (Change Owner):** Changes the owner of a file or directory.
​
   ```
   $ chown new_owner file.txt
   ```
​
4. **useradd/userdel:** Add or delete user accounts.
​
   ```
   $ sudo useradd newuser
   $ sudo userdel olduser
   ```
​
5. **passwd:** Change a user's password.
​
   ```
   $ passwd username
   ```
​
## SSH Authencation
​
1. **SSH Client:** The SSH client is the software or command-line tool used to initiate a secure connection to a remote server or device.
2. **SSH Server:** The SSH server runs on the remote machine and listens for incoming SSH client connections. It handles authentication and allows access to the server's resources.
3. **SSH Key Pair:** SSH uses key pairs for authentication. The key pair consists of a public key (usually stored on the server) and a private key (stored on the client). The private key should be kept secret, while the public key can be shared.
4. **Authentication:** SSH keys are used to authenticate the user or system connecting to the SSH server. When you connect, the server checks if your public key matches the one stored on the server. If they match and you provide the corresponding private key, you are granted access.
5. **Passphrase:** A passphrase is an optional additional layer of security for your SSH private key. It's like a password for your key. You can use a passphrase to protect your private key from unauthorized access.
​
### 1. Generating SSH Key Pair
​
To generate an SSH key pair, use the `ssh-keygen` command:
​
```
$ ssh-keygen -t rsa -b 4096
```
​
This command will generate a 4096-bit RSA key pair. You can choose a different key type and bit length if needed. After generating the keys, you'll find them in the `~/.ssh/` directory (e.g., `id_rsa` for the private key and `id_rsa.pub` for the public key).
​
### 2. Copying Your Public Key to a Remote Server
​
To allow SSH access to a remote server, copy your public key to the server's `~/.ssh/authorized_keys` file:
​
```
$ ssh-copy-id user@remote_server
```
​
Or, manually copy the contents of your `~/.ssh/id_rsa.pub` file to the server's `~/.ssh/authorized_keys` file.
​
### 3. SSH Connection
​
To establish an SSH connection to a remote server, use the `ssh` command:
​
```
$ ssh user@remote_server
```
​
If you've set a passphrase for your private key, you'll be prompted to enter it for authentication.
​
### 4. Transferring Files Securely
​
You can use `scp` (Secure Copy) or `sftp` (Secure FTP) to transfer files securely between your local machine and a remote server:
​
Using `scp` to copy a file to a remote server:
​
```
$ scp local_file.txt user@remote_server:/path/to/destination/
```
​
Using `sftp` for interactive file transfer:
​
```
$ sftp user@remote_server
```
​
​
​
## 1. **APT (Advanced Package Tool)** - Debian/Ubuntu
​
- **Installation:** APT comes pre-installed on Debian-based distributions like Ubuntu.
​
- **Usage:**
​
  - Install a package:
​
    ```
    sudo apt-get install package_name
    ```
​
  - Update package lists:
​
    ```
    sudo apt-get update
    ```
​
  - Upgrade installed packages:
​
    ```
    sudo apt-get upgrade
    ```
​
  - Remove a package:
​
    ```
    sudo apt-get remove package_name
    ```
​
## 2. **YUM (Yellowdog Updater Modified)** - Red Hat/CentOS
​
- **Installation:** YUM is the default package manager for Red Hat-based distributions like CentOS.
​
- **Usage:**
​
  - Install a package:
​
    ```
    sudo yum install package_name
    ```
​
  - Update package lists:
​
    ```
    sudo yum check-update
    ```
​
  - Upgrade installed packages:
​
    ```
    sudo yum update
    ```
​
  - Remove a package:
​
    ```
    sudo yum remove package_name
    ```
​
## 3. **DNF (Dandified YUM)** - Modern Red Hat/Fedora
​
- **Installation:** DNF is the successor to YUM and is used in recent versions of Fedora and Red Hat.
​
- **Usage:**
​
  - Install a package:
​
    ```
    sudo dnf install package_name
    ```
​
  - Update package lists:
​
    ```
    sudo dnf check-update
    ```
​
  - Upgrade installed packages:
​
    ```
    sudo dnf upgrade
    ```
​
  - Remove a package:
​
    ```
    sudo dnf remove package_name
    ```
​
## 4. **Pacman** - Arch Linux
​
- **Installation:** Pacman is the default package manager for Arch Linux.
​
- **Usage:**
​
  - Install a package:
​
    ```
    sudo pacman -S package_name
    ```
​
  - Update package lists:
​
    ```
    sudo pacman -Sy
    ```
​
  - Upgrade installed packages:
​
    ```
    sudo pacman -Syu
    ```
​
  - Remove a package:
​
    ```
    sudo pacman -R package_name
    ```
​
## 5. **Homebrew** - macOS
​
- **Installation:** Homebrew is a popular package manager for macOS.
​
- **Usage:**
​
  - Install a package:
​
    ```
    brew install package_name
    ```
​
  - Update package lists:
​
    ```
    brew update
    ```
​
  - Upgrade installed packages:
​
    ```
    brew upgrade
    ```
​
  - Remove a package:
​
    ```
    brew uninstall package_name
    ```
​
​
​
## Dot Files and Directories
​
1. **Dot Files:** Dot files are named with a leading period (e.g., `.config`, `.bashrc`). They are hidden by default when you list the contents of a directory using `ls`. These files often contain conf...
