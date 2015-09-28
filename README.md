# docker-generate-npm-authtoken

Input credentials, output auth token.

## Why

For some reason, the `npm login` command is interactive, and this causes problems when you need to call the command from non-interactive shells such as in a Dockerfile. By using the `bravissimolabs/generate-npm-authtoken` you can generate an auth token. Output this to `~/.npmrc` and you are now authenticated with npm and can `npm install` private npm modules.

## Usage

    docker run \
        -e NPM_USER=$NPM_USER \
        -e NPM_PASS=$NPM_PASS \
        -e NPM_EMAIL=$NPM_EMAIL \
        bravissimolabs/generate-npm-authtoken

If you want to save output to `~/.npmrc` where it doesn't exist, you can simply redirect the output.

    docker run \
        -e NPM_USER=$NPM_USER \
        -e NPM_PASS=$NPM_PASS \
        -e NPM_EMAIL=$NPM_EMAIL \
        bravissimolabs/generate-npm-authtoken \
        > ~/.npmrc

Bear in mind that this will overwrite an existing `.npmrc`, so if you don't want to do that, append it instead with `>>`. Note: when there are multiple auth tokens in `.npmrc`, npm uses the last occurrence.

    docker run \
        -e NPM_USER=$NPM_USER \
        -e NPM_PASS=$NPM_PASS \
        -e NPM_EMAIL=$NPM_EMAIL \
        bravissimolabs/generate-npm-authtoken \
        >> ~/.npmrc
