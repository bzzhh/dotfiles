# dotfiles

## Installing

Run `stow` to symlink everything or just select what you want

```sh
stow */ # Everything (the '/' ignores the README)
```

```sh
stow zsh # Just my zsh config
```

### tmux

Install plugins with `prefix + I`

## Remember npm packages

```sh
npm --location=global list > npm-global.txt
```

## Save terminal conf

```sh
dconf dump /org/gnome/terminal/legacy/profiles:/ > gnome-terminal-profiles.dconf
```

## Resources

- <https://systemcrafters.cc>
- <https://www.lunarvim.org>
- <https://www.youtube.com/c/ThePrimeagen>
- <https://github.com/ChristianChiarulli/Machfiles>
- <https://www.davidbegin.com/how-i-use-tmux/>
- <https://github.com/Antonio-Bennett/lvim>
- <https://github.com/abzcoding/>
- <https://lukesmith.xyz/>
- <https://github.com/rwxrob>
- <https://git.sr.ht/~whynothugo/dotfiles/>
- <https://github.com/dreamsofcode-io/tmux>
