FROM docker.io/ubuntu:22.04

USER root
RUN chmod 1777 /tmp

RUN apt-get -y update && apt-get -y upgrade && apt-get -y autoremove && apt-get -y clean
RUN apt-get -y install \
    # Dev Tools
    build-essential \
    sudo \
    vim \
    clang \
    libc++-dev \
    libc++abi-dev \
    openssh-client \
    cmake \
    lldb \
    gdb \
    btop \
    tmux \
    curl \
    # SkyWeaver Dependencies
    libsfml-dev

# Create a new sudo user 'skyweaver'
RUN useradd -ms /bin/bash skyweaver
RUN usermod -aG sudo skyweaver
RUN passwd -d skyweaver

# Install Neovim for development
RUN cd /tmp && \
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz && \
    rm -rf /opt/nvim && \
    tar -C /opt -xzf nvim-linux-x86_64.tar.gz && \
    echo 'export PATH="$PATH:/opt/nvim-linux-x86_64/bin' >> /home/skyweaver/.bashrc

# Switch to root user
USER skyweaver

# Ensure HOME is set correctly for the user 'skyweaver'
ENV HOME /home/skyweaver

# Change working directory to the home of 'skyweaver'
WORKDIR ${HOME}

# Ensure 'skyweaver' user has appropriate permissions in its home directory
RUN chown -R skyweaver:skyweaver ${HOME}

ENTRYPOINT []
CMD []