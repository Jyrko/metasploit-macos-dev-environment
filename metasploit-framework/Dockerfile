FROM ubuntu:22.04

RUN apt update && apt install -y git autoconf build-essential libpcap-dev libpq-dev zlib1g-dev libsqlite3-dev

RUN apt-get update && apt-get install -y --no-install-recommends \
  ca-certificates curl git build-essential \
  libssl-dev libreadline-dev zlib1g-dev libyaml-dev libffi-dev \
  libgdbm-dev libgdbm-compat-dev libncurses5-dev libtool bison autoconf \
  && rm -rf /var/lib/apt/lists/*

RUN git clone --depth 1 https://github.com/rbenv/ruby-build.git /tmp/ruby-build \
  && /tmp/ruby-build/install.sh \
  && rm -rf /tmp/ruby-build

RUN ruby-build 3.3.8 /opt/ruby-3.3.8 \
  && ln -s /opt/ruby-3.3.8/bin/ruby /usr/local/bin/ruby \
  && ln -s /opt/ruby-3.3.8/bin/gem /usr/local/bin/gem \
  && ln -s /opt/ruby-3.3.8/bin/bundle /usr/local/bin/bundle

ENV PATH="/opt/ruby-3.3.8/bin:${PATH}"

RUN ruby -v

WORKDIR /metasploit-framework

# RUN ./msfdb init --connection-string="postgres://postgres:mysecretpassword@postgres:5432/postgres"

# RUN ./msfconsole -qx "db_status; exit"