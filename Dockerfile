FROM alpine:3.5

MAINTAINER Rory McCune <rorym@mccune.org.uk>

#Need git to clone the repo, util-linux for hexdump and bind-tools for dig
#Need bash 'cause that's what testssl.sh is written in!
RUN apk update && apk upgrade && apk --update add \ 
  git bash util-linux bind-tools

#Clone the repo
RUN git clone --depth=1 https://github.com/drwetter/testssl.sh.git

WORKDIR /testssl.sh

ENTRYPOINT ["/testssl.sh/testssl.sh"]
