# Tokyo Night for Posting

The Tokyo Night theme collection for the [Posting](https://github.com/darrenburns/posting) TUI API client.

## Installation

1. Locate which directory Posting uses for user data.

   Posting uses the standard `XDG_DATA_HOME` directory for user data. To locate the themes directory, the `posting` CLI can be used:

   ```bash
   posting locate themes
   ```

   On a typical Linux installation, this should print something like `/home/your-username/.local/share/posting/themes`.

2. Navigate to the `extras/posting` directory.

3. Copy all `.yml` themes to Posting's custom themes directory.

   ```bash
   cp *.yml /home/your-username/.local/share/posting/themes/
   ```

Alternatively, run the following one-liner from the base of the `tokyonight.nvim` repo:

```bash
cp extras/posting/*.yml $(posting locate themes | sed '1d')
```
