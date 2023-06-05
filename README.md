# Personal NVIM dev environment docker setup #

Dockerized NVIM IDE for unfriendly environments with Go ready to go.

The company I work for block connections to npm and other utilities needed for
NVIM to work correctly out of the box. I've tried to include as many language servers
as possible (well at least the common ones)

This image is more or less is becoming a full blown dev environment for "just in case" moments.
While keeping the image as small as possible some of the utilities included

* Go
* tmux
* ranger
* python3
* jq
* ripgrep
* fd-find
* mc (midnight commander)
* tldr
* oh-my-zsh
* git


## Build ##
` docker build -t windle/nvim .`

## Run ##
` docker run --rm -it windle/nvim /bin/zsh`

If you'd like to attach a volume then run this
`docker run -it -v {YOUR FOLDER LOCATION}:$(HOME)/{SOME LOCATION} windle/lvim /bin/zsh`

### Example ###
an example of me using the src dir for go projects
`docker run -it -v $(HOME)/go/src:$(HOME)go/src windle/nvim /bin/zsh`

## Pull image ##
If you don't want to build the image which takes roughly 10 mins or so you can pull via `docker pull fluiddrakx/lvim`

Don't forget to run `:Lazy sync` after running the container

# TODO #
[x] Add github action for pulling in my 'main' NeoVIM repo to the config/nvim folder

### Thanks ###
Thanks to the NeoVIM team
