FROM alpine:3.5
MAINTAINER Michele Adduci <info@micheleadduci.net>

VOLUME ["/document"]

RUN apk update && apk upgrade && \
    apk --update add \
    ruby \
    ruby-dev \
    ruby-irb \
    ruby-rake \
    ruby-io-console \
    ruby-bigdecimal \
    ruby-json \
    ruby-bundler \
    libstdc++ \
    curl \
    tzdata \
    build-base \
    libxml2-dev \
    libxslt-dev \
    postgresql-dev \
    bash && \
    echo 'gem: --no-document' > /etc/gemrc && \
    gem install --no-ri --no-rdoc nokogiri && \
    gem install --no-ri --no-rdoc asciidoctor-confluence && \
    gem install --no-ri --no-rdoc asciidoctor-diagram && \
    gem install --no-ri --no-rdoc asciidoctor-epub3 --version 1.5.0.alpha.6 && \
    gem install --no-ri --no-rdoc asciidoctor-pdf --version 1.5.0.alpha.14 && \
    gem install --no-ri --no-rdoc asciidoctor-pdf-cjk && \
    gem install --no-ri --no-rdoc coderay pygments.rb thread_safe epubcheck kindlegen && \
    gem install --no-ri --no-rdoc slim && \
    gem install --no-ri --no-rdoc haml tilt && \
    apk del curl ruby-bundler postgresql-dev make gcc g++ && \
    rm -rf /var/cache/apk/*

ENTRYPOINT ["asciidoctor-pdf"]
