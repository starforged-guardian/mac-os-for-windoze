# Migration Notes

Moving data is separate from learning the operating system. Keep the migration boring.

## Apple Migration Assistant

Apple's Migration Assistant can copy contacts, calendars, email accounts, browser bookmarks, documents, photos, music, videos, and other user files from a Windows PC to a Mac.

Practical advice:

- Update Windows and macOS first.
- Keep both machines plugged in.
- Put both machines on the same network, or use Ethernet if available.
- Disable VPN, third-party firewall, and antivirus tools temporarily if migration fails.
- Expect large migrations to take hours.
- Keep the Windows machine unchanged until you have verified your files on the Mac.

Official guide: [Transfer from PC to Mac with Migration Assistant](https://support.apple.com/en-us/102565).

## Manual Transfer

Manual transfer is often cleaner for power users:

- Copy Documents, Desktop, Pictures, Videos, Downloads, and project folders explicitly.
- Export browser bookmarks if you are changing browsers.
- Reinstall apps fresh instead of copying application folders.
- Keep a read-only archive of the old PC for a few weeks.
- Avoid copying old system caches, temp folders, or program files.

## Cloud Sync

OneDrive, Dropbox, Google Drive, iCloud Drive, and Syncthing can all work. Do one major sync system at a time during migration to avoid duplicate folders.

Watch for:

- Files-on-demand placeholders that look present but are not downloaded.
- Case-only filename differences.
- Path length issues inherited from old Windows folders.
- Cloud folders inside cloud folders.

## External Drives

- exFAT is the easiest cross-platform format for temporary transfer drives.
- APFS is best for Mac-only SSDs.
- NTFS is usually read-only without third-party software.
- Time Machine should have its own dedicated backup destination.

## Developer Migration

Do not try to copy WSL directly into macOS. Instead:

- Re-clone active repositories.
- Reinstall language toolchains with Homebrew, `mise`, `uv`, `rustup`, or the language's official installer.
- Recreate SSH keys only if you cannot securely transfer them.
- Check line endings and executable bits in Git.
- Prefer project-specific setup docs over global machine state.

## Photos And Media

Photos can import from folders after Migration Assistant or manual copy. Keep original folders until imports and library backups are verified.
