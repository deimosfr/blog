# Deimosfr Blog
You can find my blog hosted here.

# Setup
If you want to use it to write an article, here is how to setup for the first time:

```
git clone https://github.com/deimosfr/blog.git
cd blog
git submodule update --init
cd .git/hooks
ln -s ../../scripts/pre_ci_hook.sh ./pre-commit
```

# Create a new post

```
hugo new post/$(date +%Y-%m-%d)-my-title.md
```
