Playing with chef-client and docker.
---
>I got this idea when I was going to walk through this learning tutorial
https://learn.chef.io/modules/learn-the-basics

Instead of creating a vagrant box, I wanted to try create a docker instance.
That is, build a docker image with chef-client and use it as a CLI om my development machine.

But when testing recipies, I did not want to actually install on my system.
That is when I got the idea of leaving the docker instance running instead of destroying it after every run.

The experiment:
- building a docker image with chef-client.
- added chefdk
- starting docker instance with chef-client.
- exposing port 80 (tutorial was going to install apache2)
- mounted /working to current working directory.
- running chef-client in local-mode with recipies in current directory.

assuming the docker instance with chef-client and chefdk is running,
and the bash aliases are setup for chef-client and chef

I can now use commands like

`chef generate cookbook cookbooks/learn_chef_apache2`

(this would create a cookbook using the command line tolls inside the docker instance)

since files are created and mounted in current working directory, I could edit those with an editor.

Then run commands like

`chef-client --local-mode --runlist 'recipe[learn_chef_apache2]'`

(this would invoke chef-client inside docker instance and install apache2 there)

Since the docker instance was started with `--working directory` and exposing port 80 I could now run `curl localhost:8080` and see the content served from apache from inside the docker instance.
