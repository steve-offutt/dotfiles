FROM ubuntu:latest

# Install sudo
RUN apt-get update && apt-get install -y sudo

# Create a new user named 'dockeruser'
RUN useradd -m -s /bin/bash dockeruser

# Add 'dockeruser' to the sudo group
RUN usermod -aG sudo dockeruser

# (Optional) Configure sudo to not require a password for 'dockeruser'
# This is often done in development environments for convenience but might be a security risk in production.
RUN echo 'dockeruser ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Set the default user to 'dockeruser'
USER dockeruser

# Set the working directory
WORKDIR /home/dockeruser
