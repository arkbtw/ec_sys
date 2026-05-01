# EC\_SYS

Patched version of ec\_sys kernel module for non-debug builds.

# Installation

```bash
sudo dnf install dkms
git clone https://github.com/arkbtw/ec_sys.git
cd ec_sys
sudo make install
```

uninstall with:
```bash
sudo make uninstall
```

# Usage

An example python code to activate fanboost mode on lenovo y520 laptop.
```python
with open("/dev/ec_sys","r+b") as f:
     f.seek(0xBD)
     f.write(b'\x40')
```

