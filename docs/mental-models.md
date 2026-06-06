# Mac Mental Models

The hard part of switching is usually not "where is the button?" It is realizing the operating system has different assumptions.

## Apps And Windows Are Separate

Windows often treats an app window as the app. macOS treats the app as a process that can have zero, one, or many windows.

- Red close button closes the window.
- Command-W closes the active window or tab.
- Command-Q quits the app.
- Command-Tab switches apps, not every window.
- Command-Grave switches windows within the current app.

If that never feels right, install AltTab and use a Windows-style window switcher.

## The Menu Bar Belongs To The Active App

The top menu bar changes when the active app changes. If you cannot find a command, look at the top of the screen, not inside the window.

Useful habit: click the Help menu and search for a command by name. macOS will often point to the exact menu item.

## Finder Is Not File Explorer

Finder is built around locations, sidebars, tags, search, and multiple views. Practical differences:

- Return renames the selected file.
- Command-Down opens the selected file or folder.
- Command-Up goes to the parent folder.
- Command-Delete moves to Trash.
- Space previews a file with Quick Look.
- Tags are first-class metadata, not just colored labels.

## The Dock Is Not The Taskbar

The Dock is a launcher, a running-app indicator, and a place for minimized windows. It is not a complete replacement for the Windows taskbar.

For task switching, learn Command-Tab, Mission Control, and AltTab.

## Permissions Are Normal

macOS requires explicit permission for apps that observe input, control other apps, record the screen, or read protected folders. This is why tools like AltTab, Rectangle, Karabiner-Elements, and Mac Mouse Fix may ask for permissions.

See [Privacy and permissions](privacy-permissions.md) before granting permissions blindly.

## Package Management Is Optional But Useful

Homebrew is the common package manager for Mac power users. It can install command-line tools and GUI apps through casks. This repo uses Brewfiles so installs are repeatable and reviewable.

## The Filesystem Is Familiar With A Few Traps

- Your home folder is `/Users/yourname`.
- Apps usually live in `/Applications`.
- Apple Silicon Homebrew usually lives in `/opt/homebrew`.
- Intel Homebrew often lives in `/usr/local`.
- macOS paths are Unix paths, even when Finder displays friendly names.
- APFS is case-insensitive by default, but case-sensitive volumes exist.

## "It Just Works" Still Has State

Macs hide a lot of complexity until you need it. When troubleshooting, check:

- System Settings permissions.
- Login Items and background items.
- App-specific settings in the menu bar.
- Whether you closed a window or quit the app.
- Whether a tool needs a restart after an update.
