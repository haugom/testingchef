FROM ubuntu:16.04
RUN apt-get update && apt-get install -y \
  curl \
  wget \
  apt-transport-https \
  && wget -qO - https://packages.chef.io/chef.asc | apt-key add - \
  && echo "deb https://packages.chef.io/repos/apt/stable xenial main" > chef-stable.list \
  && mv chef-stable.list /etc/apt/sources.list.d/ \
  && apt-get update \
  && apt-get install -y chef chefdk ssh \
  && chef gem install kitchen-digitalocean \
  && cp -R /root/.chefdk /.chefdk \
  && chmod -R o+rx /.chefdk \
  && apt-get -y purge curl wget \
&& rm -rf /var/lib/apt/lists/*
ENV PATH $PATH:/root/.chefdk/gem/ruby/2.4.0/bin
ENTRYPOINT ["chef-client"]
CMD ["--help"]
