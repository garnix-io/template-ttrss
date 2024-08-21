# template-ttrss

A garnix-compatible repo for deploying your own [tiny-tiny-rss](https://tt-rss.org/) server.

To get your own ttrss going:

1) Create a [garnix](https://garnix.io) account if you don't have one yet.
2) Fork this repo.
3) Make sure the garnix GitHub App is enabled on this repo.
4) Update the host name in the server config
  [./hosts/server.nix](https://github.com/garnix-io/template-ttrss/blob/main/hosts/ttrss.nix).
5) [Optional] Add your public ssh key in 
  [./hosts/server.nix](https://github.com/garnix-io/template-ttrss/blob/main/hosts/ttrss.nix).
  This will allow you to ssh into your deployed host.
6) Push your changes! garnix will build and deploy the package, and make your
   server available in a `garnix.me` domain.

 This [Tiny Tiny RSS](https://server.main.template-ttrss.garnix-io.garnix.me) gets deployed
automatically with this repository.
