**Notes:**

Remember you need to install Rosetta
`softwareupdate --install-rosetta`

I have symlinked `.config` to `/etc/nix-darwin/` so i can run `sudo darwin-rebuild switch` easily
without hassle. also has removed some editing roadblocks of having to sudo everything

**todo:**
need to clean up nvim dotfiles, it's really really all over the place. i've taken too much stuff
from a bunch of old dotfiles of mine and random snippets online. 

## git
you need to setup a couple things for this all to work nice

First you need to add `.ssh/config.d/work-secrets` file that works like:
```
Host <work host, something like git.company.domain>
    HostName <work host>
    User git
    IdentityFile ~/.ssh/id_ed25519_work
    IdentitiesOnly yes
```

secondly you need the gitfile at root called `.gitconfig-work`:
```
[user]
    name = <work-git-name>
    email = <work-git-email>

```

the rest is already setup in the nix config. any extra profiles can be easily and quickly copy/pasted
