# Recommended Tools

This list is optimized for Windows power users moving to MacBooks. Install only what solves an actual friction point for you.

Checked: June 6, 2026.

| Tool | Why it helps | Install | License and cost notes |
| --- | --- | --- | --- |
| [AltTab](https://alt-tab.app/) | Windows-like window switching across individual windows. | `brew install --cask alt-tab` | Open source. Free core; Pro adds features such as search and extra styles. |
| [Rectangle](https://rectangleapp.com/) | Window snapping with keyboard shortcuts and screen-edge snap areas. | `brew install --cask rectangle` | Free and open source; paid Pro version available. |
| [Maccy](https://maccy.app/) | Lightweight clipboard history. | `brew install --cask maccy` | Open source. Requires newer macOS versions; check current minimum before installing. |
| [Stats](https://github.com/exelban/stats) | CPU, memory, network, disk, battery, and sensor info in the menu bar. | `brew install --cask stats` | Open source. Some modules have energy impact; enable only what you need. |
| [Karabiner-Elements](https://karabiner-elements.pqrs.org/) | Advanced keyboard remapping for Windows-style keys and power-user layouts. | `brew install --cask karabiner-elements` | Open source. Requires deep input permissions. |
| [Mac Mouse Fix](https://macmousefix.com/) | Better third-party mouse buttons, gestures, and scrolling. | `brew install --cask mac-mouse-fix` | Open source. Current app versions may use a trial or small purchase model; check vendor page. |
| [Raycast](https://www.raycast.com/) | Keyboard launcher, snippets, clipboard, quicklinks, calculator, and extensions. | `brew install --cask raycast` | Proprietary freemium. Powerful, but review account, AI, and extension settings. |
| [AppCleaner](https://freemacsoft.net/appcleaner/) | Removes app support files when uninstalling GUI apps. | `brew install --cask appcleaner` | Freeware, not open source. Use carefully and review files before deleting. |
| [iTerm2](https://iterm2.com/) | Terminal replacement with profiles, panes, search, and power-user features. | `brew install --cask iterm2` | Free. Review advanced integrations before enabling them. |
| [Visual Studio Code](https://code.visualstudio.com/docs/setup/mac) | Familiar editor for many Windows developers. | `brew install --cask visual-studio-code` | Microsoft product built on open source Code - OSS. Extension trust still matters. |

## Common CLI Tools

These are useful if you live in terminals or missed Linux/WSL tooling:

```bash
brew install git gh jq ripgrep fd fzf bat eza zoxide direnv git-delta btop tree wget coreutils gnu-sed
```

| Tool | Use |
| --- | --- |
| `ripgrep` | Fast text search, usually better than `grep -R`. |
| `fd` | Friendly file finder. |
| `fzf` | Fuzzy selection in the terminal. |
| `bat` | `cat` with syntax highlighting. |
| `eza` | Modern `ls` replacement. |
| `zoxide` | Smarter `cd` based on directory history. |
| `direnv` | Per-project environment variables. |
| `git-delta` | Better Git diffs. |
| `btop` | Terminal resource monitor. |

## Suggested Install Order

1. Learn built-in macOS behavior for a day.
2. Install `windows-feel` tools if switching and snapping are slowing you down.
3. Add `power-user` tools if Spotlight and the menu bar feel too limited.
4. Add `dev` tools when you are ready to make the terminal comfortable.

## Permission Notes

Window switchers, window managers, keyboard remappers, and mouse tools often need Accessibility, Input Monitoring, or Screen Recording permissions. That does not automatically mean they are unsafe, but it does mean you should install them from official sources and understand why the permission is needed.
