# Git

## Dealing with accidental commits
Preferrably, add `.gitignore` first, so you don't erroneously push anything to begin with...
- If you've already committed/pushed a file, adding it to `.gitignore` later will not remove it from the repo, nor exclude it from future commits
- You have to remove it from the cache
  - e.g. `git rm --cached -r .idea`
    - Recursive flag, since it's a directory
- Then, run `git status` to confirm the files are listed as `deleted`
  - `git commit -m "..."` these changes

NOTE: .idea will still be in the repo's commit history
- If something more sensitive was pushed, this method wouldn't be sufficient
  - Someone could `git clone`, then `checkout` to a previous commit to get it
- `git reset` soft, if you want to keep work done since that erroneous commit, `--hard` if that isn't a concern
  - NOTE: AWS has their own bots that constantly search for leaked credentials
  - If they find one, you/your team are notified and you're instantly fined
  - Criminals also have their own bots
- In the meantime, make sure the repo is set to 'private'
    - Or, even delete the whole repo and recreate it later (if it's only you working on the repo...)
    - Generate a new credential so the old one is invalid (if it's only you...)
    - Remove the `.git` directory and re-`git init`, removing your entire commit history



