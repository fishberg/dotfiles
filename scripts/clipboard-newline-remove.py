#!/usr/bin/env python
import subprocess
import re

def get_clipboard_text() -> str:
    """Return the current clipboard text using xclip."""
    result = subprocess.run(
        ["xclip", "-selection", "clipboard", "-o"],
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        text=True,
        check=True,
    )
    return result.stdout


def set_clipboard_text(text: str) -> None:
    """Set the clipboard text using xclip."""
    proc = subprocess.Popen(
        ["xclip", "-selection", "clipboard"],
        stdin=subprocess.PIPE,
        text=True,
    )
    stdout, stderr = proc.communicate(text)
    if proc.returncode != 0:
        raise RuntimeError(f"xclip failed with code {proc.returncode}: {stderr}")


def main():
    try:
        text = get_clipboard_text()
    except subprocess.CalledProcessError as e:
        print("Failed to read clipboard via xclip:", e)
        return

    # clean up text
    cleaned = text.strip()

    # fix words spanning two lines
    cleaned = re.sub(r'-[\n\r]', '', cleaned)

    # remove newlines and redundant spaces
    cleaned = re.sub(r'\s+', ' ', cleaned)

    try:
        set_clipboard_text(cleaned)
    except RuntimeError as e:
        print("Failed to write clipboard via xclip:", e)


if __name__ == "__main__":
    main()
