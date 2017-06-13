FROM ubuntu:16.04
RUN apt-get update && apt-get install -y \
  curl \
  wget \
  apt-transport-https \
  && wget -qO - https://packages.chef.io/chef.asc | apt-key add - \
  && echo "deb https://packages.chef.io/repos/apt/stable xenial main" > chef-stable.list \
  && mv chef-stable.list /etc/apt/sources.list.d/ \
  && apt-get update \
  && apt-get install -y \
  chef \
  chefdk \
  && apt-get -y purge curl wget \
&& rm -rf /var/lib/apt/lists/*
ENTRYPOINT ["chef-client"]
CMD ["--help"]
