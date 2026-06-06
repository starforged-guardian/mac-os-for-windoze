# Privacy And Permissions

macOS is stricter than Windows about apps observing input, controlling other apps, recording screens, or reading protected folders. Many power-user tools need these permissions to do their job.

Open permissions at:

```text
System Settings > Privacy & Security
```

## Accessibility

Allows an app to control or inspect parts of other apps. Commonly needed by:

- Rectangle, for moving and resizing windows.
- AltTab, for window switching behavior.
- Raycast, for automation and window commands.
- Mac Mouse Fix, for gestures and button behavior.

Only grant this to apps you trust.

## Screen Recording

Allows an app to capture screen contents. Commonly needed by:

- AltTab, to show window thumbnails.
- Screenshot and recording apps.
- Remote support and meeting apps.

This permission can reveal sensitive information, so keep the list short.

## Input Monitoring

Allows an app to monitor keyboard or pointer input. Commonly needed by:

- Karabiner-Elements.
- Mouse and keyboard customization tools.
- Some launcher hotkey tools.

This is powerful. Install from official sources and remove tools you no longer use.

## Full Disk Access

Allows access to protected areas such as Mail, Messages, Safari data, backups, and some system folders. Commonly needed by:

- Backup tools.
- Search/indexing tools.
- Developer tools that scan many folders.

Most onboarding tools do not need this.

## Login Items And Background Items

Many menu bar utilities need to start at login. Review:

```text
System Settings > General > Login Items & Extensions
```

Remove old tools when you stop using them. If a utility feels broken after an update, check whether macOS disabled its background item.

## A Good Permission Rule

Grant the minimum permission needed for a tool you intentionally installed from an official source. If you cannot explain why a tool needs a permission, pause and check its docs.
