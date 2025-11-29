#!/usr/bin/env python
import os
from pathlib import Path

def main():
    # Where to place symlinks
    target_dir = Path.home() / ".local/share/applications"
    target_dir.mkdir(parents=True, exist_ok=True)

    # Directory where the script itself lives
    script_dir = Path(__file__).resolve().parent

    # Recursively find all .desktop files below script_dir
    desktop_files = list(script_dir.rglob("*.desktop"))

    for src in desktop_files:
        dst = target_dir / src.name

        # If the destination already exists, remove it so we can replace it
        if dst.exists() or dst.is_symlink():
            dst.unlink()

        print(f"Linking: {src} -> {dst}")
        dst.symlink_to(src)

    print(f"Done. Symlinks created in {target_dir}")

if __name__ == "__main__":
    main()
