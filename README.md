# dotfiles

Personal dev-environment config, kept public so I can bootstrap any new machine.
Nothing secret lives here — no tokens or keys.

## Setup

```sh
git clone git@github.com:Scott-Poole/dotfiles.git ~/Projects/dotfiles
~/Projects/dotfiles/install.sh
```

`install.sh` copies the files below into `$HOME`. If a different file is
already there it warns and asks before replacing it (the old one is kept as
`<name>.bak.<timestamp>`); non-interactive runs skip those files. To add a new
dotfile, put it in the repo and add a line to the `MAP` at the top of
`install.sh`.

## What's here

| Path | Copied to | Notes |
|------|-----------|-------|
| `git/gitconfig` | `~/.gitconfig` | Name/email, aliases, meld as diff/merge tool, LFS, `main` default |
| `git/gitk` | `~/.config/git/gitk` | gitk colors/layout (no window geometry) |

## Notes

- Name/email live in `git/gitconfig`; edit the email there before running
  `install.sh` on a machine that needs a different one.
- `meld` is the diff/merge tool: `brew install --cask meld` on macOS.
