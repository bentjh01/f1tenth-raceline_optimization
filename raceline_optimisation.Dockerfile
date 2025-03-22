# Base image
FROM osrf/ros:foxy-desktop

# Set the working directory
WORKDIR /root

# Copy files from the host to the container
# COPY <source> <destination>

# Install dependencies
RUN apt-get update && \
    apt-get install -y \ 
    git \
    neovim \
    tmux \
    python3-pip \ 
    wget \
    ros-foxy-ackermann-msgs

# Clone repository
RUN git clone https://github.com/bentjh01/f1tenth_raceline_optimization.git
WORKDIR /root/f1tenth_raceline_optimization

#python requirements
RUN pip install -r requirements.txt

# Startup
# source ros2
RUN echo "source /opt/ros/foxy/setup.bash" >> /root/.bashrc

# Cleanup
RUN rm -rf ./*

# Expose ports
# EXPOSE <port>

# Set environment variables
# ENV <key>=<value>

# Run commands when the container starts
# CMD <command>

# BUILD COMMAND
# docker build -f raceline_optimisation.Dockerfile -t bentjh01/f1tenth:raceline_optimisation .

