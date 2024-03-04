FROM postgres:latest

# Copy the initialization script
COPY init_db.sh /docker-entrypoint-initdb.d/

# Make the script executable
RUN chmod +x /docker-entrypoint-initdb.d/init_db.sh
EXPOSE 5432