FROM crops/yocto:ubuntu-24.04-base

# Switch to root to install packages
USER root

# Install pipx required for kas install
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    pipx && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Switch back to yoctouser
USER yoctouser

# Install kas and oelint(Bitbake linter)
RUN pipx install kas oelint-adv
# Add pipx install dirto PATH
ENV PATH=/home/yoctouser/.local/bin:$PATH
