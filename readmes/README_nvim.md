# File tree

```
 nvim
├──  init.lua
├──  lazy-lock.json
└──  lua
    └──  my
        ├──  core
        │   ├──  functions.lua
        │   ├──  highlights.lua
        │   ├──  ime.lua
        │   ├──  init.lua
        │   ├──  keymaps.lua
        │   └──  options.lua
        ├──  lazy.lua
        └──  plugins
```




Note: 
- Why use `f.push_key_is`?
    1. This is for operations where I need to pass `Keys` as an argument.
    2. To achieve this, I'd normally have to write an anonymous function directly in the keymap command.
       example: `vim.keymap.set('n', 'j', function() myfunc('j') end)`
    3. Therefore, I created a wrapper function `push_key_is` to shorten and simplify this.

- Usage of `f.push_key_is`
    `f.push_key_is('Keys', f.myfunc)` is used when `f.myfunc` needs arguments (`Keys`).
    The `f` prefix indicates that `myfunc` is defined within the `functions.lua` module.

