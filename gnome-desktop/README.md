# GNOME Desktop

```
./link-desktop-files.py
```

## Sample `.desktop`` File
General:
```
[Desktop Entry]
Encoding=UTF-8
Version=1.0
Type=Application
Terminal=false
Exec=/path/to/executable
Name=Name of Application
Icon=/path/to/icon
Comment=Sample Text
Categories=Category1;Category2;
```

Minimalistic:
```
[Desktop Entry]
Type=Application
Terminal=false
Exec=/path/to/executable
Name=Name of Application
Icon=/path/to/icon
```

## Reload `.desktop` Files
```
update-desktop-database ~/.local/share/applications
```

## Locations of `.deskop`
General locations:
- `/usr/share/applications/`
- `~/.local/share/applications/`

```
locate *.desktop
```

## Location of autostart
```
/etc/xdg/autostart/*.desktop
```
