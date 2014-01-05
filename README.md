# John Sullivan's Portfolio

This repo contains all of the code that makes up my portfolio available at [johnsullivan.name](http://johnsullivan.name).

I hope to eventually expand my portfolio site to also include a blog, and leverage my project [Phial](https://github.com/brownhead/phial), but for now the site is a very simple static website. The code along with other resources I've added to the repo are in the `master-source` branch. The `deploy.sh` script transfers the website to the `master` branch which GitHub Pages then serves.

## Development

The code for the site itself is located in the `site/` directory. You can use the script `serve.sh` in the `utils/` directory to serve the website locally on port 8080 (point your browser at http://localhost:8080).

When ready to launch the code, make sure that all changes to `master-source` are committed. Then run `deploy.sh`. After it exits you will be in the `master` branch. You will have to add all changes (`git add -A` is a good way to do that quickly) then you will have to make a commit, the message does not matter and I usually default to something along the lines of `Deploying.`.

## Licensing

You may use the material within this repo in accordance with the terms of the [CC BY-SA 3.0](http://creativecommons.org/licenses/by-sa/3.0/) license. Please note that the projects linked to from this portfolio are not necessarily licensed in the same way.
