# Personal lvim docker setup #

Dockerized LunarVIM IDE for unfriendly environments with Go ready to go
The company I work for block connections to npm and other utilities needed for
LunarVIM to work correctly out of the box. I've tried to include as many language servers
as possible (well at least the common ones)


Below are just a few of the utilities installed

* Go
* tmux
* ranger
* python3
* jq
* ripgrep
* fd-find
* mc (midnight commander)


## Build ##
` docker build -t windle/lvim .`

## Run ##
` docker run --rm -it windle/lvim /bin/zsh`

If you'd like to attach a volume then run this
`docker run -it -v {YOUR FOLDER LOCATION}:/home/kai/SOME LOCATION /bin/zsh`

### Example ###
an example of me using the src dir for go projects
`docker run -it -v $(HOME)/go/src:/home/go/src /bin/zsh`
