# Use Node.js v16.10.0 as the base image
FROM node:16.10.0

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Copy the entrypoint script
COPY entrypoint.sh /usr/src/app/entrypoint.sh

# Make entrypoint.sh executable
RUN chmod +x /usr/src/app/entrypoint.sh

# Start and enable SSH
RUN apt-get update \
    && apt-get install -y --no-install-recommends dialog \
    && apt-get install -y --no-install-recommends openssh-server \
    && echo "root:Docker!" | chpasswd \
    && chmod u+x ./entrypoint.sh
COPY sshd_config /etc/ssh/

# Expose port 3000 for the application
EXPOSE 3000 2222

# Set the entrypoint to the script
ENTRYPOINT ["/usr/src/app/entrypoint.sh"]
