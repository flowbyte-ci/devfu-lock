
set +e

git config user.name "depfu-bot"
git config user.email "bot@depfu.io"

git checkout "${TRAVIS_BRANCH}"

bundle install

git add Gemfile.lock
git commit -m "Gemfile.lock updated by Depfu"
# git commit --amend --no-edit

git remote add depfu-origin https://${GH_TOKEN}@github.com/depfutest/devfu-lock
git push depfu-origin "${TRAVIS_BRANCH}" --force --quiet
