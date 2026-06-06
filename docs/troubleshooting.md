# Troubleshooting

## AltTab Does Not Show Window Previews

Check:

- AltTab is running.
- Screen Recording permission is granted.
- Accessibility permission is granted if requested.
- The shortcut did not change after an update.
- The app is not filtered out in AltTab settings.

If you only want built-in behavior, use Command-Tab for apps and Command-Grave for windows inside the current app.

## Rectangle Shortcuts Do Nothing

Check:

- Accessibility permission is granted.
- The shortcut conflicts with another app.
- The target window is resizable.
- Rectangle is running from `/Applications`, not a disk image.

Some app windows cannot be resized by third-party tools.

## Function Keys Control Brightness Instead Of F1-F12

Open:

```text
System Settings > Keyboard
```

Look for the function-key behavior setting. You can also hold Fn or Globe to switch behavior temporarily.

## Homebrew Command Not Found

Apple Silicon Homebrew usually installs to `/opt/homebrew`. Intel Homebrew often installs to `/usr/local`.

Run:

```bash
./scripts/check-mac.sh
```

If Homebrew is missing, the onboarding script prints the official install command from Homebrew.

## Apps Say They Are Damaged Or Cannot Be Opened

Prefer official downloads or Homebrew casks. If Gatekeeper blocks an app you trust:

- Open System Settings > Privacy & Security.
- Look for the blocked app message.
- Choose Open Anyway only if you trust the source.

Do not run random terminal commands from search results to bypass Gatekeeper.

## Mouse Wheel Or Buttons Feel Wrong

Check:

- System Settings > Mouse.
- Vendor software for your mouse.
- Mac Mouse Fix for generic third-party mice.
- Whether natural scrolling feels right for trackpad but wrong for wheel mouse.

macOS links scroll direction across devices by default, which bothers many Windows users.

## Closing A Window Did Not Quit The App

That is normal on macOS. Use Command-Q to quit. The dot under an app in the Dock means it is still running.

## External Monitor Arrangement Feels Backwards

Open:

```text
System Settings > Displays > Arrange
```

Drag displays into the physical layout you actually use. Also check which display owns the menu bar.

## Uninstalling Apps Leaves Files Behind

Many Mac apps store preferences and support files under `~/Library`. AppCleaner can find related files, but review its list before deleting anything.

## Battery Seems Worse After Installing Menu Bar Tools

Disable high-frequency modules first:

- Sensor polling.
- Bluetooth polling.
- Network throughput graphs.
- Always-on AI or indexing features.

Menu bar tools are useful, but every always-on tool has a cost.
