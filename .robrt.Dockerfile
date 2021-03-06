FROM ubuntu:15.10
ENV PS1="# "
RUN mkdir -p /var/git
RUN apt-get update
RUN apt-get install -y texlive
RUN apt-get install -y software-properties-common git texlive-xetex latexmk
RUN add-apt-repository -y ppa:haxe/releases && apt-get update && apt-get install -y haxe neko
RUN apt-get -y install pandoc fonts-freefont-otf
RUN haxelib setup /usr/share/haxe/lib && haxelib install utest
RUN git clone https://github.com/jonasmalacofilho/docopt.hx /var/git/docopt.hx && cd /var/git/docopt.hx && git checkout a716273 && haxelib dev docopt /var/git/docopt.hx

