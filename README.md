# docker-generate-npm-authtoken

## Why

For some reason, the `npm login` command is interactive, and this causes problems when you need to call the command from non-interactive shells such as in a Dockerfile. By using the `bravissimolabs/generate-npm-authtoken` you can generate an auth token. Output this to `~/.npmrc` and you are now authenticated with npm and can `npm install` private npm modules.

## Usage

    docker run \
        -e NPM_USER=$NPM_USER \
        -e NPM_PASS=$NPM_PASS \
        -e NPM_EMAIL=$NPM_EMAIL \
        bravissimolabs/generate-npm-authtoken

Save output to `~/.npmrc`:

    docker run \
        -e NPM_USER=$NPM_USER \
        -e NPM_PASS=$NPM_PASS \
        -e NPM_EMAIL=$NPM_EMAIL \
        bravissimolabs/generate-npm-authtoken \
        > ~/.npmrc
