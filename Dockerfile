FROM alpine:latest

LABEL description="Dockerized LunarVIM IDE for unfriendly environments with Go ready to go"

RUN apk add --no-cache shadow xclip sudo ninja ranger shellcheck curl unzip wget zsh shfmt \
  tmux openssh go cargo python3 cmake jq grep make git neovim ripgrep nodejs npm alpine-sdk openssl bash --update

# Ensure PIP is installed
RUN python3 -m ensurepip --upgrade

# Ensure we have as many language servers and formatters installed as possible
RUN sudo pip3 install pynvim black flake8
RUN sudo npm install -g neovim prettier \
  yaml-language-server bash-language-server \
  typescript-language-server ansible-language-server mysql-language-server \
  pyright sql-language-server vscode-langservers-extracted

RUN cargo install stylua fd-find

ENV \
  UID="1000" \
  GID="1001" \
  SHELL="/bin/zsh" \
  USER="kai" \
  HOME="/home/kai" \
  TZ="Europe/London" 

RUN addgroup -g $GID docker
RUN adduser \
    -S \
    --disabled-password \
	--gecos ${USER} \
    --home ${HOME} \
	--shell /bin/zsh \
    --ingroup ${USER} \
	--uid ${UID} \
	-G wheel \
	${USER}

# Add user to sudoers
RUN mkdir -p /etc/sudoers.d \
	&& echo "$USER ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/$USER \
	&& chmod 0440 /etc/sudoers.d/$USER

# Change the default shell
RUN printf "MyPassword\nMyPassword" | passwd
RUN echo "MyPassword" | chsh -s $(which zsh) kai

WORKDIR $HOME
USER $USER

ENV LV_BRANCH='release-1.2/neovim-0.8'

# Get the lunarvim config
RUN  bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/fc6873809934917b470bff1b072171879899a36b/utils/installer/install.sh)

RUN mkdir -p $HOME/go/src
RUN mkdir -p $HOME/go/bin
RUN mkdir -p $HOME/go/pkg

# Install oh-my-zsh
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Install fzf
RUN git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
RUN $HOME/.fzf/install --all

ENV GOPATH="${HOME}/go" \
  GOBIN="${HOME}/go/bin" \
  TERM="xterm-256color" \
  GOROOT="/usr/lib/go" 

# rather easy alias to copy the contents of a file
RUN echo 'alias copy="xclip -sel clip < $1"' >> $HOME/.bashrc
RUN echo 'alias copy="xclip -sel clip < $1"' >> $HOME/.zshrc

# Paths
RUN echo "export PATH=$GOBIN:$GOPATH:/usr/local/bin:$HOME/.local/bin:$PATH" >> /home/kai/.zshrc
RUN echo "export PATH=$GOBIN:$GOPATH:/usr/local/bin:$HOME/.local/bin:$PATH" >> /home/kai/.bashrc

# Custom configs for tmux and lunarvim
COPY tmux.conf $HOME/.tmux.conf
COPY config.lua $HOME/.config/lvim/config.lua
COPY gitconfig $HOME/.gitconfig

RUN go install github.com/cweill/gotests/gotests@latest
RUN go install github.com/fatih/gomodifytags@latest
RUN go install github.com/go-delve/delve/cmd/dlv@latest
RUN go install github.com/josharian/impl@latest
RUN go install github.com/ramya-rao-a/go-outline@latest
RUN go install github.com/uudashr/gopkgs/v2/cmd/gopkgs@latest
RUN go install golang.org/x/lint/golint@latest
RUN go install golang.org/x/tools/cmd/benchcmp@latest
RUN go install golang.org/x/tools/cmd/bundle@latest
RUN go install golang.org/x/tools/cmd/callgraph@latest
RUN go install golang.org/x/tools/cmd/compilebench@latest
RUN go install golang.org/x/tools/cmd/cover@latest
RUN go install golang.org/x/tools/cmd/digraph@latest
RUN go install golang.org/x/tools/cmd/eg@latest
RUN go install golang.org/x/tools/cmd/fiximports@latest
RUN go install golang.org/x/tools/cmd/getgo@latest
RUN go install golang.org/x/tools/cmd/go-contrib-init@latest
RUN go install golang.org/x/tools/cmd/godex@latest
RUN go install golang.org/x/tools/cmd/goimports@latest
RUN go install golang.org/x/tools/cmd/gomvpkg@latest
RUN go install golang.org/x/tools/cmd/gorename@latest
RUN go install golang.org/x/tools/cmd/gotype@latest
RUN go install golang.org/x/tools/cmd/goyacc@latest
RUN go install golang.org/x/tools/cmd/guru@latest
RUN go install golang.org/x/tools/cmd/ssadump@latest
RUN go install golang.org/x/tools/cmd/stress@latest
RUN go install golang.org/x/tools/cmd/stringer@latest
RUN go install golang.org/x/tools/cmd/toolstash@latest
RUN go install golang.org/x/tools/go/analysis/passes/findcall/cmd/findcall@latest
RUN go install golang.org/x/tools/go/analysis/passes/ifaceassert/cmd/ifaceassert@latest
RUN go install golang.org/x/tools/go/analysis/passes/lostcancel/cmd/lostcancel@latest
RUN go install golang.org/x/tools/go/analysis/passes/nilness/cmd/nilness@latest
RUN go install golang.org/x/tools/go/analysis/passes/shadow/cmd/shadow@latest
RUN go install golang.org/x/tools/go/analysis/passes/stringintconv/cmd/stringintconv@latest
RUN go install golang.org/x/tools/go/analysis/passes/unmarshal/cmd/unmarshal@latest
RUN go install golang.org/x/tools/go/analysis/unitchecker/...
RUN go install golang.org/x/tools/go/gcexportdata/...
RUN go install golang.org/x/tools/go/packages/gopackages@latest
RUN go install golang.org/x/tools/gopls@latest
RUN go install github.com/jesseduffield/lazygit@latest

