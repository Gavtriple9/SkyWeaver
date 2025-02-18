FROM docker.io/ubuntu:22.04

USER root
RUN chmod 777 /tmp

RUN apt-get -y update && apt-get -y upgrade && apt-get -y autoremove && apt-get -y clean

# Install Dev Tools
RUN apt-get -y install \
    build-essential \
    clang \
    libc++-dev \
    libc++abi-dev \
    openssh-client \
    cmake \
    lldb \
    gdb \
    btop \
    curl \
    tmux 

# Install SkyWeaver Dependencies
RUN apt-get -y install \
    libx11-dev \
    libx11-xcb-dev \
    libfontenc-dev \ 
    libice-dev \ 
    libsm-dev \ 
    libxau-dev \ 
    libxaw7-dev

# # Install Rust for development
# RUN curl https://sh.rustup.rs -sSf | sh -s -- -y
# ENV PATH="/root/.cargo/bin:${PATH}"

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

# Install skyweaver
# ENV CARGO_NET_GIT_FETCH_WITH_CLI=true
# RUN mkdir -p /root/.ssh && ssh-keyscan github.com >> /root/.ssh/known_hosts
# WORKDIR /skyweaver
# RUN --mount=type=bind,source=.,target=/skyweaver,rw \
#     --mount=type=cache,target=/skyweaver/target/ \
#     --mount=type=ssh \
#     LDFLAGS="-static" cargo build --release -p skyweaver

# Switch to root user
USER skyweaver

# Ensure HOME is set correctly for the user 'skyweaver'
ENV HOME /home/skyweaver

# Change working directory to the home of 'skyweaver'
WORKDIR ${HOME}

# Ensure 'skyweaver' user has appropriate permissions in its home directory
RUN chown -R skyweaver:skyweaver ${HOME}

# Now install rustup here
# RUN curl https://sh.rustup.rs -sSf | sh -s -- -y

ENTRYPOINT []
CMD []