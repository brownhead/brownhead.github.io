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

# From here on every command will be printed out before it is executed
set -x

# From here on if any command fails the script will abort
set -e

cd $DIR/..

# Ensure we're on master.
CURRENT_BRANCH=`what_branch`
if [[ "$CURRENT_BRANCH" != "master-source" ]]; then
    echo "Must be on master"
	exit 1
fi

# Move the site to a temporary directory
TEMP_DIR=`mktemp -d`
mv ./site/* "$TEMP_DIR"/

# Tranfer the site into the master branch.
git checkout master
rm -rf *
cp -f "$TEMP_DIR"/* ./

# Add the CNAME file
echo johnsullivan.name > CNAME

# Disable the printing out of every command, we're done with the bulk of the
# script now.
set +x

echo
echo "${GREEN}DONE${RESET}. You should now examine the state of the current"
echo "branch and make an appropriate commit, then push the changes to github."
