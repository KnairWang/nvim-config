```
git clone https://github.com/KnairWang/nvim-config "$env:LOCALAPPDATA\nvim"
```

### rust-analyzer:
- git: `https://github.com/rust-analyzer/rust-analyzer`
- branch: `release`
- script: `cargo xtask install --server`


### TreeSitter
this need msys2/mingw64
follow this doc: `https://www.msys2.org/`
and add `.../mingw64/bin` to `$PATH`
```
TSInstall toml

TSInstall all
```


