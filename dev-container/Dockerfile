FROM ubuntu:24.04

RUN apt-get update && \
  apt-get install -y \
  apt-transport-https \
  ca-certificates \
  build-essential \
  fzf \
  curl \
  neovim \
  ripgrep \
  gcc \
  gnupg \
  curl \
  findutils \
  git \
  ssh \
  vim \
  sudo \
  dos2unix \
  pipx \
  locales \
  libssl-dev \
  zlib1g-dev \
  libbz2-dev \
  libreadline-dev \
  libsqlite3-dev \
  libncursesw5-dev \
  xz-utils \
  tk-dev \
  libxml2-dev \
  libxmlsec1-dev \
  libffi-dev \
  liblzma-dev \
  && \
  rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://pyenv.run | bash && \
  echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc && \
  echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc && \
  echo 'eval "$(pyenv init - bash)"' >> ~/.bashrc && \
  touch ~/.profile && \
  echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.profile && \
  echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.profile && \
  echo 'eval "$(pyenv init - bash)"' >> ~/.profile && \
  localedef -i en_US -f UTF-8 en_US.UTF-8

# Install kubectl (https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/#install-using-native-package-management)
RUN curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.32/deb/Release.key | gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg && \
  chmod 644 /etc/apt/keyrings/kubernetes-apt-keyring.gpg # allow unprivileged APT programs to read this keyring && \
  echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.32/deb/ /' | tee /etc/apt/sources.list.d/kubernetes.list && \
  chmod 644 /etc/apt/sources.list.d/kubernetes.list && \   
  apt-get update && \
  apt-get install -y kubectl

# Install helm 
RUN curl https://baltocdn.com/helm/signing.asc | gpg --dearmor | tee /usr/share/keyrings/helm.gpg > /dev/null && \
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | tee /etc/apt/sources.list.d/helm-stable-debian.list && \
  apt-get update && \
  apt-get install helm

RUN curl -sS https://webinstall.dev/k9s | bash

# Install LazyGit, a git terminal UI
RUN LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*') && \
  curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz" && \
  tar xf lazygit.tar.gz lazygit && \
  install lazygit -D -t /usr/local/bin/ && \
  rm lazygit.tar.gz lazygit


RUN ~/.pyenv/bin/pyenv install 3.12 && ~/.pyenv/bin/pyenv global 3.12

# Install dev Python packages
RUN pipx ensurepath && pipx install pre-commit poetry

RUN mkdir -p /root/.config
COPY nvim /root/.config/nvim

#RUN usermod -l mk ubuntu
RUN nvim --headless "+Lazy! sync" +qa


