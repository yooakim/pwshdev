FROM mcr.microsoft.com/powershell:7.5-ubuntu-24.04

ARG USERNAME
ENV USERNAME=${USERNAME:-snover}


# Switch to root user for setup
USER root
# Set working directory so stuff doesn't end up in /
WORKDIR /home/$USERNAME


# Configure apt
ENV DEBIAN_FRONTEND=noninteractive

# Uncomment this section to install additional packages.
RUN apt-get update \ 
    && apt-get -y install --no-install-recommends \
    git \
    curl \
    wget \
    unzip \
    zip \
    jq \
    rsync \
    nano \
    procps \
    lsb-release \
    && rm -rf /var/lib/apt/lists/*ssh

# Add non-root user
RUN groupadd --gid 1000 $USERNAME && \
    useradd --uid 1000 --gid 1000 -m $USERNAME

## Make sure to reflect new user in PATH
ENV PATH="/home/${USERNAME}/.local/bin:${PATH}"
USER $USERNAME

# Trust PSGallery
SHELL [ "pwsh", "-Command" ]

# Install modules we want & need
RUN Set-PSRepository -Name PSGallery -InstallationPolicy Trusted  && \
    Install-Module Az, Pester, Terminal-Icons -Scope CurrentUser  && \
    New-Item -Path $PROFILE -ItemType File -Force  && \
    Set-Content -Path $PROFILE -Value 'Set-StrictMode -Version latest'  && \
    Add-Content -Path $PROFILE -Value 'Import-Module PSReadLine'  && \
    Add-Content -Path $PROFILE -Value 'Import-Module Terminal-Icons'  && \
    Add-Content -Path $PROFILE -Value 'Import-Module Pester -PassThru'  && \    
    Add-Content -Path $PROFILE -Value 'Set-PSReadLineOption -PredictionSource History'  && \
    Add-Content -Path $PROFILE -Value 'Set-PSReadLineOption -EditMode Windows'  && \
    Add-Content -Path $PROFILE -Value 'Set-PSReadLineOption -PredictionViewStyle ListView'

# Set permissions in the same layer as it's related to setup
RUN chown -R $USERNAME:$USERNAME /home/$USERNAME

CMD ["pwsh"]

