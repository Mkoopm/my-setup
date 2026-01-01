FROM ubuntu:24.04

RUN apt-get update && \
  apt-get install -y \
  apt-transport-https \
  ca-certificates \
  build-essential \
  curl \
  xclip \
  ripgrep \
  gcc \
  gnupg \
  curl \
  findutils \
  docker.io \
  git \
  tar \
  unzip \
  ssh \
  podman \
  buildah \
  fuse-overlayfs \
  npm \
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


# TODO: install neovim checking for cpu architecture
#
#
# Install Neovim with architecture detection
RUN ARCH=$(uname -m) && \
  if [ "${ARCH}" = "aarch64" ]; then \
  NVIM_ARCH="arm64"; \
  else \
  NVIM_ARCH="x86_64"; \
  fi && \
  curl -LO https://github.com/neovim/neovim/releases/download/v0.11.5/nvim-linux-${NVIM_ARCH}.tar.gz && \
  tar -xzf nvim-linux-${NVIM_ARCH}.tar.gz && \
  mv nvim-linux-${NVIM_ARCH} /opt/nvim && \
  ln -s /opt/nvim/bin/nvim /usr/local/bin/nvim && \
  rm nvim-linux-${NVIM_ARCH}.tar.gz

RUN ARCH=$(uname -m) && \
  if [ "${ARCH}" = "aarch64" ]; then \
  FZF_ARCH="arm64"; \
  else \
  FZF_ARCH="amd64"; \
  fi && \
  curl -LO https://github.com/junegunn/fzf/releases/download/v0.67.0/fzf-0.67.0-linux_${FZF_ARCH}.tar.gz && \
  ls && \
  tar -xzf fzf-0.67.0-linux_${FZF_ARCH}.tar.gz && \
  mv fzf /usr/local/bin/ && \
  rm fzf-0.67.0-linux_${FZF_ARCH}.tar.gz


RUN touch ~/.profile && \
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
RUN curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

RUN curl -sS https://webinstall.dev/k9s | bash

# Install LazyGit, a git terminal UI
RUN LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*') && \
  curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz" && \
  tar xf lazygit.tar.gz lazygit && \
  install lazygit -D -t /usr/local/bin/ && \
  rm lazygit.tar.gz lazygit

# to run code server: code-server --bind-addr 0.0.0.0:8080 --auth none /home/ubuntu/repositories
RUN curl -fsSL https://code-server.dev/install.sh | sh

RUN curl -LsSf https://astral.sh/uv/install.sh | sh

# Install dev Python packages
RUN pipx ensurepath && pipx install pre-commit poetry

RUN mkdir -p /root/.config

RUN mkdir -p /home/developer/.config/containers && \
    echo 'export BUILDAH_ISOLATION=chroot' >> /home/developer/.bashrc

# Copy configs to a staging area (not in /home/ubuntu)
COPY --chown=ubuntu:ubuntu nvim /opt/initial-config/.config/nvim
COPY --chown=ubuntu:ubuntu nvim /home/ubuntu/.config/nvim
COPY --chown=ubuntu:ubuntu dotfiles/.tmux.conf /opt/initial-config/.tmux.conf

WORKDIR /home/ubuntu
RUN chown -R 1000:1000 .

USER ubuntu

RUN mkdir -p $HOME/.local/share/nvim/site/pack \
  $HOME/.local/state/nvim \
  $HOME/.cache/nvim
RUN nvim --headless -c "quitall"
RUN nvim --headless "+Lazy! restore" +qa
# RUN nvim --headless "+Lazy! install" +qa

CMD ["/bin/bash"]
