# First Hour Setup

This checklist is for the first hour on a MacBook after years on Windows. The goal is not perfection. The goal is to stop fighting the machine.

## 1. Learn The Three Modifier Keys

- Command is usually the Mac version of Ctrl for app shortcuts: copy, paste, save, quit, find, open.
- Option is the Mac version of Alt for alternate actions, special characters, and hidden menu choices.
- Control is not the main shortcut key. It is used for terminal habits, Control-click, and some system shortcuts.

Start by replacing "Ctrl" with "Command" in your head for app commands.

## 2. Fix Window Muscle Memory

Install these first if you miss Windows window behavior:

```bash
./scripts/onboard.sh --profile windows-feel
```

That profile includes:

- AltTab for Windows-like window switching.
- Rectangle for snapping windows to halves, corners, and thirds.
- Maccy for clipboard history.
- Mac Mouse Fix for better third-party mouse behavior.
- Karabiner-Elements for advanced keyboard remaps.
- AppCleaner for uninstall cleanup.

## 3. Configure Trackpad And Mouse

Open System Settings and review:

- Trackpad: tap to click, tracking speed, secondary click, three-finger drag if desired.
- Mouse: tracking speed, secondary click, natural scrolling.
- Keyboard: key repeat, delay until repeat, function-key behavior.

Many Windows users prefer disabling natural scrolling for a wheel mouse while keeping it on for the trackpad. macOS links these by default, so a tool like Mac Mouse Fix or a dedicated mouse driver may help.

## 4. Accept The App vs Window Difference

On macOS, closing the last window usually does not quit the app. Use:

- Command-Q to quit an app.
- Command-W to close a window or tab.
- Command-Tab to switch apps.
- Command-Grave to switch windows within the current app.
- AltTab if you want a Windows-style "every window is in the switcher" model.

## 5. Make Finder Less Mysterious

Finder is the Mac file manager. Start with these changes:

- Finder > Settings > General: show hard disks and external disks if you want them on the desktop.
- Finder > Settings > Sidebar: add your home folder, Downloads, and external disks.
- Finder > View > Show Path Bar.
- Finder > View > Show Status Bar.
- Use Command-Up to go to the parent folder.
- Use Command-Delete to move selected files to Trash.

## 6. Learn Spotlight Before Replacing It

Press Command-Space to open Spotlight. It launches apps, finds files, does calculations, starts settings pages, and searches the web.

Power users may prefer Raycast later, but learning Spotlight first makes every Mac easier to use, including locked-down work machines.

## 7. Run The Readiness Check

```bash
./scripts/check-mac.sh
```

It does not change anything. It reports the basics that usually matter during setup: macOS version, chip, Homebrew, Xcode Command Line Tools, Rosetta, FileVault, Time Machine, and shell.
