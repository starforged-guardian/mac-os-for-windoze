# Mac OS for Windoze

A field guide and confirm-only toolkit for Windows power users onboarding to a MacBook.

This repo is not trying to make macOS pretend to be Windows. It helps you understand the parts that are genuinely different, then fills the rough edges with small, reversible tools: better window switching, window snapping, clipboard history, keyboard remaps, mouse behavior, package management, and developer setup.

## Quick Start

```bash
./scripts/check-mac.sh
./scripts/onboard.sh --dry-run --profile all
./scripts/onboard.sh --profile windows-feel
```

If Homebrew is not installed, the onboarding script prints the official Homebrew install command and stops. It does not install Homebrew for you.

## What Is Inside

- [First hour setup](docs/first-hour.md): the shortest path from "where is everything?" to a comfortable machine.
- [Shortcut map](docs/shortcuts.md): Windows actions translated to Mac shortcuts.
- [Mac mental models](docs/mental-models.md): apps vs windows, Finder vs Explorer, the global menu bar, permissions, and the Dock.
- [Recommended tools](docs/tools.md): AltTab, Rectangle, Maccy, Stats, Karabiner-Elements, Mac Mouse Fix, Raycast, AppCleaner, iTerm2, VS Code, and CLI tools.
- [Migration notes](docs/migration.md): Migration Assistant, manual file transfer, cloud sync, and external drives.
- [Privacy and permissions](docs/privacy-permissions.md): why productivity tools ask for Accessibility, Screen Recording, Input Monitoring, and Full Disk Access.
- [Troubleshooting](docs/troubleshooting.md): common snags for Windows switchers.

## Scripts

All scripts are designed to be inspectable shell scripts with conservative defaults.

```bash
./scripts/check-mac.sh
./scripts/onboard.sh --dry-run --profile all
./scripts/macos-defaults.sh --dry-run
./scripts/shortcut-drill.sh
```

- `scripts/check-mac.sh`: read-only readiness report for macOS version, chip, Homebrew, Xcode Command Line Tools, Rosetta, FileVault, Time Machine, shell, and permission hints.
- `scripts/onboard.sh [--dry-run] [--profile windows-feel|power-user|dev|all]`: asks before each `brew bundle` operation. Dry-run mode prints the commands it would run.
- `scripts/macos-defaults.sh [--dry-run|--apply]`: dry-run by default. Apply mode prompts per setting and backs up touched defaults domains first.
- `scripts/shortcut-drill.sh`: terminal flashcards for translating Windows shortcuts to Mac shortcuts.

## Brewfile Profiles

The profiles are layered:

- `brewfiles/windows-feel.Brewfile`: Windows-like window switching, snapping, clipboard history, keyboard customization, mouse behavior, and uninstall cleanup.
- `brewfiles/power-user.Brewfile`: launcher, menu bar/system monitor, and everyday command-line helpers.
- `brewfiles/dev.Brewfile`: terminal, editor, GitHub CLI, and developer-friendly Unix tools.

Run a dry-run first:

```bash
./scripts/onboard.sh --dry-run --profile all
```

## Karabiner Examples

Karabiner-Elements can make a Mac keyboard feel friendlier to a Windows-trained hand, but it is powerful enough to make things confusing. Start with the notes in [karabiner/README.md](karabiner/README.md), then import only the examples you actually want.

## Safety Model

- No script downloads remote code.
- No script installs software without asking first.
- No macOS defaults are changed unless you pass `--apply` and confirm the specific setting.
- The defaults script backs up touched domains under `~/.mac-os-for-windoze/backups/`.
- The guide is explicit when a recommended app is open source, proprietary, free, paid, or freemium.

## Sources Checked

Recommendations were checked on June 6, 2026 against Apple Support, Homebrew, and the current vendor or project pages linked from [docs/tools.md](docs/tools.md). Third-party products change, so treat prices, licensing, and minimum macOS versions as things worth re-checking before publishing a release.

## Contributing

Contributions are welcome. Please read [CONTRIBUTING.md](CONTRIBUTING.md) and keep advice practical, current, and kind to people who are still building Mac muscle memory.

## License

MIT. See [LICENSE](LICENSE).
