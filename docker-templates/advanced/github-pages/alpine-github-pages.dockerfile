FROM alpine:3.5
MAINTAINER Michele Adduci <info@micheleadduci.net>

VOLUME /site

EXPOSE 4000

WORKDIR /site

RUN apk update && \
    apk --update add \
        gcc \
        g++ \
        make \
        curl \
        bison \
        ca-certificates \
        tzdata \
        ruby \
        ruby-rdoc \
        ruby-irb \
        ruby-bundler \
        ruby-dev \
    	glib-dev \
        libc-dev \
        && \       
    apk upgrade --available && \ 
    echo 'gem: --no-document' > /etc/gemrc && \ 
    gem install --no-ri --no-rdoc github-pages && \
    apk del gcc g++ binutils bison perl nodejs make curl && \
    rm -rf /var/cache/apk/*

ENTRYPOINT ["jekyll"]
