#!/bin/bash

# MySQL root credentials
MYSQL_ROOT_USER="root"
MYSQL_ROOT_PASSWORD="root_password"

# New database and user details
DB_NAME="example_database"
DB_USER="example_user"
DB_PASSWORD="example_password"

# Create new MySQL database and user
mysql -u "$MYSQL_ROOT_USER" -p"$MYSQL_ROOT_PASSWORD" <<EOF
CREATE DATABASE IF NOT EXISTS $DB_NAME;
CREATE USER IF NOT EXISTS '$DB_USER'@'localhost' IDENTIFIED BY '$DB_PASSWORD';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'localhost';
FLUSH PRIVILEGES;
EOF

echo "Database and user created."
