# SMBSE - Bash Shell Extension

Enhanced `.bashrc` with unique tools, organized filesystem, and built-in code execution. Designed for Termux and Linux.

![smbse_screnshot](https://github.com/user-attachments/assets/d2022899-3534-4216-898b-9b426f477939)


## Installation

```bash
# Backup first
cp ~/.bashrc ~/.bashrc.backup

# Install via curl (no git required)
curl 'https://raw.githubusercontent.com/StringManolo/SMBSE/main/.bashrc' -o ~/.bashrc && source ~/.bashrc
```

---

## Default Aliases

```bash
l          ls
la         ls -a
v          vim
c          clear
cl         clear && ls
..         cd ..
...        cd ../..
....       cd ../../..
.....      cd ../../../..
pserv      python -m http.server
gitc       git clone
775        chmod +775
folder     du -h --max-depth=1
h          history
irc        weechat
myip       curl http://ifconfig.me/ip 
quit       exit
q          exit
sb         source ~/.bashrc
update     apt-get update && apt-get upgrade
gacp       git add --all && git commit $1 && git push
del        compress and move a file to recyclebin
delete     same as del
recycle    delete files inside /recyclebin
recover    recover deleted files and move them to /recovered
```

## Folder Shortcuts

```bash
_smbse         _user           _rb            _ns
_ts            _ss             _os            _bs
_p             _a              _b             _c
_cpp           _css            _go            _html
_java          _javascript     _js            _browser
_node          _qjs            _lua           _perl
_php           _python         _python2       _ruby
_sql           _pp             _projects      _h
_ht            _htoolS         _hanalysis     _hnotes
_hreports      _hig            _hinfo         _hexploits
_hpostexploit  _hpersistence   _hbruteforce   _hreversing
_hwireless     _hblackseo      _sysadmin      _logs
```

---

## Filesystem Structure

```
SMBSE/bin          # Add your custom scripts/binaries
SMBSE/.tmp         # Internal use (ignore)
SMBSE/user/recycleBin    # Deleted files (compressed)
SMBSE/user/recovered     # Restored files
SMBSE/user/nStorage      # Normal permanent storage
SMBSE/user/tStorage      # Auto-cleaning temp storage
SMBSE/user/sStorage      # Secure (not implemented)
SMBSE/user/oStorage      # Online (not implemented)
SMBSE/user/bStorage      # Backup (not implemented)
SMBSE/user/programming/  # Code organized by language
SMBSE/user/hacking/tools/  # Security tools by category
SMBSE/user/sysadmin/logs   # System logs
```

**tStorage TTL**: Set `SMBSE_TTL_TSTORAGE="1"` (minutes). Files auto-delete on new terminal session if expired. Timer resets on modification.

---

## Code Execution

### JavaScript (QuickJS)
```bash
js 'console.log(7 * 7);'

js 'let hello = "hello world";
for (let i in hello) {
  console.log(hello[i]);
}'

js 'let httpHeaders = run("curl --silent https://example.com -I");
console.log(httpHeaders)' | grep -i server

js 'let homeFiles = run("ls ~").split("\n");
homeFiles.splice(homeFiles.length - 1);
console.log("Home files in json:\n" + JSON.stringify(homeFiles, null, 2));'
```

### C++
```bash
c++ 'cout << 7 * 7;'

c++ '#include <stdio.h>
printf("Hello %s", "world");
'

c++ 'cout << "Hey! how are you?";' | grep -i hey

c++ 'cout << "Need to add more examples xD" << endl;'
```

---

## System Info

```bash
sysinfo
```

Shows detailed Linux and Android information (if applicable):

```
.------------------- LINUX ----------------------.
  SMBSE Version:         0.1
  Operative System:      Android
  Kernel Version:        4.14.116
  CPU:                   Cortex-A53
  Architecture:          aarch64
  Vendor:                ARM
  CPU MAX MHz:           2189.0000
  CPU MIN MHz:           480.0000
  CPU Operation:         32-bit, 64-bit
  CPU Cores:             8
  RAM Total:             3.593
  RAM Available:         1.112
  Packages Installed:    488
  Packages Upgradable:   166
  Public IP:             37.10.141.235
  System Started:        2021-02-04 17:20:31

.------------------- ANDROID --------------------.
  Model:                 HUAWEI P40 lite E
  Version:               10.1.0.164C432
  APN:                   telefonica.es
  [additional Android info...]
```

---

## Customization

**Files to edit:**
- `~/SMBSE/alias` - Add persistent aliases
- `~/SMBSE/extras` - Add custom functions
- `~/SMBSE/motd` - Customize welcome message
- `~/SMBSE/logout` - Customize exit behavior

**Environment Variables:**
```bash
SMBSE_TTL_TSTORAGE="1"    # Temp storage TTL (minutes)
EDITOR='vim'              # Default editor
```

---

## Requirements

- Bash (interactive shell)
- QuickJS (auto-downloaded on first run)
- Optional: `vim`, `7z`, `curl`, `lscpu`, `g++`

---

## Future Plans

- Enhanced special storage folders
- Language tutorials in programming folders
- Auto-update and version tracking
- Dependency manager
- Config CLI tool (no direct .bashrc editing)
- Vim/sh default configs
- Richer command set beyond `@help`
