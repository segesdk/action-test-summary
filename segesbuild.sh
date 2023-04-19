#!/bin/bash
# This files is used by SEGES (mac@seges.dk) to make local changes to the action
# We don't want to pollute the main branch and/or the dist branch with our changes, in case we need to update the fork
# So instead of using the workflow to release on the dist branch, we "release" a dist folder in this branch by running this script locally in WSL
npm ci
npm run test
./node_modules/.bin/tsc 
./node_modules/.bin/ncc build
rm ./*.js
cp bin/*.js .
git add -f ./*.js