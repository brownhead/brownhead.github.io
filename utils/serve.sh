#!/usr/bin/env bash

#: what_branch
#:
#: Prints the name of the git branch you are currently on.
#:
#: .. note::
#:
#:    Pulled from `this StackOverflow post <http://stackoverflow.com/a/1593487/1989056>`_.
function what_branch {
    branch_name="$(git symbolic-ref HEAD 2>/dev/null)" ||
    branch_name="(unnamed branch)"     # detached HEAD

    echo ${branch_name##refs/heads/}
}

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# This will ensure the user is visually prompted upon failure
trap "echo FAILURE: An error has occured! >&2" EXIT

# From here on every command will be printed out before it is executed
set -x

# From here on if any command fails the script will abort
set -e

cd $DIR/../site/

# Ensure we're on master-source.
CURRENT_BRANCH=`what_branch`
if [[ "$CURRENT_BRANCH" != "master-source" ]]; then
    echo "Must be on master-source"
	exit 1
fi

python -m SimpleHTTPServer 8080 || echo Done

# Unset the trap so we don't freak the user out by telling them an error has
# occured when everything went fine.
trap - EXIT
