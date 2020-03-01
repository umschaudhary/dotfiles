<h1 align="center">vim-colors-xcode</h1>

<h3 align="center">A number of Xcode 11’s colourschemes, now for Vim!</h3>
<p align="center"><em>made in <a href="https://github.com/lifepillar/vim-colortemplate">Colortemplate</a>, the Toolkit for Vim Colourscheme Designers</em></p>

<details>
<summary>Screenshots</summary>

![](https://raw.githubusercontent.com/arzg/resources/master/xcodedark.png)
![](https://raw.githubusercontent.com/arzg/resources/master/xcodelight.png)
![](https://raw.githubusercontent.com/arzg/resources/master/xcodewwdc.png)

</details>

<details>
<summary>High contrast variants are available</summary>

| `xcodedark`                                                                                 | `xcodedarkhc` (high-contrast)                                                                 |
| --                                                                                          | --                                                                                            |
| ![](https://raw.githubusercontent.com/arzg/resources/master/xcode-comparison/xcodedark.png) | ![](https://raw.githubusercontent.com/arzg/resources/master/xcode-comparison/xcodedarkhc.png) |

---

| `xcodelight`                                                                                 | `xcodelighthc` (high-contrast)                                                                 |
| --                                                                                           | --                                                                                             |
| ![](https://raw.githubusercontent.com/arzg/resources/master/xcode-comparison/xcodelight.png) | ![](https://raw.githubusercontent.com/arzg/resources/master/xcode-comparison/xcodelighthc.png) |
</details>

<details>
<summary>Installation</summary>

Use your favorite runtimepath/plugin manager. If you don’t have one, I recommend [Plug](https://github.com/junegunn/vim-plug).
</details>

<details>
<summary>Language Support</summary>

These colourschemes have been carefully tuned for the following language plugins:

- CSS ([hail2u/vim-css3-syntax](https://github.com/hail2u/vim-css3-syntax))
- Git ([tpope/vim-git](https://github.com/tpope/vim-git))
- Go ([fatih/vim-go](https://github.com/fatih/vim-go))
- HTML ([othree/html5.vim](https://github.com/othree/html5.vim))
- JSON (built-in)
- JavaScript ([pangloss/vim-javascript](https://github.com/pangloss/vim-javascript))
- Markdown ([tpope/vim-markdown](https://github.com/tpope/vim-markdown))
- Rust ([arzg/vim-rust-syntax-ext](https://github.com/arzg/vim-rust-syntax-ext))
- SCSS ([cakebaker/scss-syntax.vim](https://github.com/cakebaker/scss-syntax.vim))
- Swift ([arzg/vim-swift](https://github.com/arzg/vim-swift))
- Vim help (built-in)
- VimL (built-in)
</details>

<details>
<summary>Plugin Support</summary>

These plugins are specifically supported:

- [Matchup](https://github.com/andymass/vim-matchup)
- [Searchlight](https://github.com/PeterRincker/vim-searchlight)
</details>

<details>
<summary>Options</summary>

Use `:help xcode<variant>`, where variant is either `dark`, `darkhc`, `light`, or `lighthc` to view a list of all the possible options from within Vim. Add `g:xcode<variant>_` in front of every option name for use. For example, `emph_funcs` would turn into `g:xcodedarkhc_emph_funcs` if you want it to apply to the dark high contrast variant and `g:xcodelight_emph_funcs` for the light version.

<details>
<summary>Comment Style</summary>

| <sup>`green_comments`</sup> | Dark | Light |
| -- | -- | -- |
| `0` | ![](https://raw.githubusercontent.com/arzg/resources/master/xcode-green-0-dark.png) | ![](https://raw.githubusercontent.com/arzg/resources/master/xcode-green-0-light.png) |
| `1` | ![](https://raw.githubusercontent.com/arzg/resources/master/xcode-green-1-dark.png) | ![](https://raw.githubusercontent.com/arzg/resources/master/xcode-green-1-light.png) |
</details>

<details>
<summary>Syntax Item Emphasis</summary>

| <sup>`emph_types`, `emph_funcs`, `emph_idents`</sup> | Dark | Light |
| -- | -- | -- |
| `1`,<br>`0`,<br>`0` | ![](https://raw.githubusercontent.com/arzg/resources/master/xcode-types-1-funcs-0-idents-0-dark.png) | ![](https://raw.githubusercontent.com/arzg/resources/master/xcode-types-1-funcs-0-idents-0-light.png) |
| `0`,<br>`1`,<br>`0` | ![](https://raw.githubusercontent.com/arzg/resources/master/xcode-types-0-funcs-1-idents-0-dark.png) | ![](https://raw.githubusercontent.com/arzg/resources/master/xcode-types-0-funcs-1-idents-0-light.png) |
| `0`,<br>`1`,<br>`1` | ![](https://raw.githubusercontent.com/arzg/resources/master/xcode-types-0-funcs-1-idents-1-dark.png) | ![](https://raw.githubusercontent.com/arzg/resources/master/xcode-types-0-funcs-1-idents-1-light.png) |
</details>
</details>

<details>
<summary>Usage</summary>

If you’re using a GUI, then vim-colors-xcode should work out of the box. However, if you’re planning to use vim-colors-xcode in a terminal, the terminal must support 24-bit colour, also known as True Colour. If you want other terminal output to match with vim-colors-xcode, then set its colours to match the ones below:

<details>
<summary>Dark Palette</summary>

| Colour     | Normal    | Bright    |
| ---        | ---       | ---       |
| Black      | `#393b44` | `#7f8c98` |
| Red        | `#ff8170` | `#ff8170` |
| Green      | `#78c2b3` | `#acf2e4` |
| Yellow     | `#d9c97c` | `#ffa14f` |
| Blue       | `#4eb0cc` | `#6bdfff` |
| Magenta    | `#ff7ab2` | `#ff7ab2` |
| Cyan       | `#b281eb` | `#dabaff` |
| White      | `#dfdfe0` | `#dfdfe0` |
| Foreground | `#dfdfe0` |           |
| Background | `#292a30` |           |
</details>

<details>
<summary>Dark High Contrast Palette</summary>

| Colour     | Normal    | Bright    |
| ---        | ---       | ---       |
| Black      | `#34353b` | `#838991` |
| Red        | `#ff8a7a` | `#ff8a7a` |
| Green      | `#83c9bc` | `#b1faeb` |
| Yellow     | `#d9c668` | `#ffa14f` |
| Blue       | `#4ec4e6` | `#6bdfff` |
| Magenta    | `#ff85b8` | `#ff85b8` |
| Cyan       | `#cda1ff` | `#e5cfff` |
| White      | `#ffffff` | `#ffffff` |
| Foreground | `#ffffff` |           |
| Background | `#1f1f24` |           |
</details>

<details>
<summary>Light Palette</summary>

| Colour     | Normal    | Bright    |
| ---        | ---       | ---       |
| Black      | `#e5e5e5` | `#8a99a6` |
| Red        | `#d12f1b` | `#d12f1b` |
| Green      | `#3e8087` | `#23575c` |
| Yellow     | `#78492a` | `#78492a` |
| Blue       | `#0f68a0` | `#0b4f79` |
| Magenta    | `#ad3da4` | `#ad3da4` |
| Cyan       | `#804fb8` | `#4b21b0` |
| White      | `#262626` | `#262626` |
| Foreground | `#262626` |           |
| Background | `#ffffff` |           |
</details>

<details>
<summary>Light High Contrast Palette</summary>

| Colour     | Normal    | Bright    |
| ---        | ---       | ---       |
| Black      | `#e5e5e5` | `#8a99a6` |
| Red        | `#ad1805` | `#ad1805` |
| Green      | `#355d61` | `#174145` |
| Yellow     | `#78492a` | `#78492a` |
| Blue       | `#0058a1` | `#003f73` |
| Magenta    | `#9c2191` | `#9c2191` |
| Cyan       | `#703daa` | `#441ea1` |
| White      | `#000000` | `#000000` |
| Foreground | `#000000` |           |
| Background | `#ffffff` |           |
</details>

<details>
<summary>WWDC Palette</summary>

| Colour     | Normal    | Bright    |
| ---        | ---       | ---       |
| Black      | `#383b45` | `#7f869e` |
| Red        | `#bb383a` | `#bb383a` |
| Green      | `#94c66e` | `#94c66e` |
| Yellow     | `#d28e5d` | `#d28e5d` |
| Blue       | `#8884c5` | `#8884c5` |
| Magenta    | `#b73999` | `#b73999` |
| Cyan       | `#00aba4` | `#00aba4` |
| White      | `#e7e8eb` | `#e7e8eb` |
| Foreground | `#e7e8eb` |           |
| Background | `#292c36` |           |
</details>

iTerm presets for all these palettes are included with this repository.

If you would like to have italic comments add the following to your `vimrc`:

```viml
augroup vim-colors-xcode
    autocmd!
augroup END

autocmd vim-colors-xcode ColorScheme * hi Comment        cterm=italic gui=italic
autocmd vim-colors-xcode ColorScheme * hi SpecialComment cterm=italic gui=italic
```
</details>

The font in the screenshots is [SF Mono](https://developer.apple.com/videos/play/wwdc2016/803/?time=106), which you can download [from Apple’s website](https://developer.apple.com/fonts/).
