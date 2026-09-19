A tiny yazi functional plugin to use `fzf` to cd to directories, using `fd`. The plugin is mostly identical to yazi's builtin fzf plugin, but only lists directories instead of files. For a much more powerful and universal fzf integration, check out [fazif.yazi](https://github.com/Shallow-Seek/fazif.yazi)

### Requirements

- [fd](https://github.com/sharkdp/fd) installed
- [fzf](https://github.com/junegunn/fzf) installed

### Installation

```sh
ya pkg add fleesk/fzf-cd
```

then add a keybind to yazi's `keymap.toml`, for example:

```toml
[[mgr.prepend_keymap]]
on = "<C-z>"
run = "plugin fzf-cd"
desc = "Jump to a directory via fzf"
```
