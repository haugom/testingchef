docker run -p 80:80 -d -t --entrypoint /usr/bin/top --name chef-client-instance --workdir /workdir -v `pwd`:/workdir chef-client
