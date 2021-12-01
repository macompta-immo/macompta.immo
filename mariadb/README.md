# MariaDB

When the MariaDB container is started for the first time, a new database with the specified name will be created and initialized with the provided configuration variables.  
Furthermore, it will execute files with extensions `.sh`, `.sql`, `.sql.gz`, `.sql.xz` and `.sql.zst` that are found in this folder (mounted at `/docker-entrypoint-initdb.d`).  
Files will be executed in alphabetical order.  
`.sh` files without file execute permission are sourced rather than executed.  
You can easily populate your mariadb services by mounting a SQL dump into that directory and provide custom images with contributed data. SQL files will be imported by default to the database specified by the MARIADB_DATABASE / MYSQL_DATABASE variable.
