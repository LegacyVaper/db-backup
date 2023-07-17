# 💾 Database Backup Script

This script is used to backup a MySQL or MariaDB database and keep a specified number of backup files. It uses the `mysqldump` command to create a backup file and the `ls`, `tail`, and `xargs` commands to delete older backup files.

## Prerequisites

- MySQL or MariaDB client installed on the system.
- Access to the MySQL/MariaDB database with the provided credentials.

## Configuration

Before running the script, make sure to configure the following variables:

- 🔑 `DB_USER`: The username for accessing the MySQL/MariaDB database.
- 🔒 `DB_PASSWORD`: The password for the MySQL/MariaDB user.
- 🗄️ `DB_NAME`: The name of the database to backup.
- 📁 `BACKUP_DIR`: The directory where backup files will be stored.
- 🔄 `MAX_BACKUPS`: The maximum number of backup files to keep.

## Running the Script

To run the script, execute the following command in a terminal:

```bash
$ bash backup.sh
```

## Script Steps

1. The script creates the backup directory if it doesn't already exist.
2. It generates a timestamp in the format `YYYYMMDDHHMMSS` using the `date` command.
3. The backup file name is constructed using the database name and the timestamp.
4. The `mysqldump` command is used to create a backup of the specified database. The `-u` option is used to provide the database username, and the `-p` option followed by the password is used to authenticate the user.
5. The backup file is saved in the backup directory with the constructed file name.
6. The script lists all backup files in the backup directory, sorts them by modification time (`-t` option), and excludes the most recent `MAX_BACKUPS` files using `tail`.
7. The older backup files are deleted using the `xargs` command with the `-d '\n'` option to handle file names with spaces or special characters.
8. Finally, a status message is printed indicating the path of the created backup file. 🎉

**Note:** Ensure that the script has executable permissions before running it. You can set the executable permission using the command `chmod +x backup.sh`.