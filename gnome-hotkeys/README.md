# gnome-hotkeys

Install general config:
```bash
./run-notebook-as-py.bash configs/general-hotkeys.csv
```

Install my config (requires dotfile-private):
```bash
./run-notebook-as-py.bash configs/my-hotkeys.csv
```

## Usage
```bash
$ ./run-notebook-as-py.bash -h
usage: .add-gnome-hotkeys.py [-h] [--overwrite] hotkey_csv

positional arguments:
  hotkey_csv   csv config script to apply

optional arguments:
  -h, --help   show this help message and exit
  --overwrite  force overwrites current GNOME hotkeys
```

* `--overwrite`: clears current GNOME hotkeys and replaces them with config

## configs
* Configs are just `.csv` files that can (1) have superfluous newlines that will be ignored, and (2) line comments indicated with `#`
* See examples in `configs` folder
* Some scripts included in my config contains sensitive information (e.g., links and IP addresses). These scripts are included in the `private-scripts` folder instead of the `scripts` folder. The contents of `private-scripts` needs to be linked from another repo.
