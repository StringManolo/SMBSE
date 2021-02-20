# SMBSE
Big .bashrc project. 

.bashrc file adding lot of tools, lot of them are unique.

Depends on some tools like quickjs and g++.

### What does:
Alias, functions and paths you can call directly. 
```
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
_hwireless     _hbalckseo      _sysadmin      _logs
```
  
  

Default configuration
```
autocd
bigger history, ignore duplicate lines
preserve history between login sessions
resize terminal output to actual size
```

Create a custom file structure to keep same organization between different linux distros, also termux.
```
SMBSE/bin  Use this folder to add commands and scripts you make. Good way to split system binaries from your own binaries.

SMBSE/.tmp  Ignore this one. The program use the folder internally to manipulate dependencies and temporal files.

SMBSE/user/recycleBin  You can delete files and folders by using the del or the delete command. The deleted files are compressed and moved here afterwards
You can recover the files by using the recover command.
Or you can permanently delete all files by running recycle.

SMBSE/user/recovered  The recovered files are available here. You probably want to manually move them to original path using mv command.

SMBSE/user/nStorage  Normal storage, nothing special. Use this folder to store all your files that dont make sense to have anywhere else. Usefull yo avoid have files everywhere.

SMBSE/user/tStorage  The files stored here are going to be removed. Youcan set the time you want to execute the remove. Use the enviroment variable directly from the terminal SMBSE_TTL_TSTORAGE="1" for no less than 1 minute.
The files are deleted when you login/open a new terminal (in case their time to live expired). The timer restarts when you create or modify a file. Max time files can live is from X to 00:00. Remember that in case you create a file at 23:58 and expect it to be there for longer period of time.

SMBSE/user/sStorage  Secure Storage is not developed yet.
SMBSE/user/oStorage  Online Storage is not developed yet.
SMBSE/user/bStorage  Backup Storage is not developed yet.
SMBSE/user/programming/assembler
SMBSE/user/programming/bash
SMBSE/user/programming/c
SMBSE/user/programming/cpp
SMBSE/user/programming/css
SMBSE/user/programming/go
SMBSE/user/programming/html
SMBSE/user/programming/java
SMBSE/user/programming/javascript/browser
SMBSE/user/programming/javascript/node
SMBSE/user/programming/javascript/qjs
SMBSE/user/programming/javascript
SMBSE/user/programming/lua
SMBSE/user/programming/perl
SMBSE/user/programming/php
SMBSE/user/programming/python
SMBSE/user/programming/python2
SMBSE/user/programming/ruby
SMBSE/user/programming/sql
SMBSE/user/programming/projects
SMBSE/user/programming   Keep track of your codes.
SMBSE/user/hacking/tools/analysis
SMBSE/user/hacking/tools/notes
SMBSE/user/hacking/tools/reports
SMBSE/user/hacking/tools/infogathering
SMBSE/user/hacking/tools/exploits
SMBSE/user/hacking/tools/postexploitation
SMBSE/user/hacking/tools/persistence
SMBSE/user/hacking/tools/bruteforce
SMBSE/user/hacking/tools/reversing
SMBSE/user/hacking/tools/wireless
SMBSE/user/hacking/tools/blackseo
SMBSE/user/hacking/tools  Security tools
SMBSE/user/hacking  Your security related stuff
SMBSE/user/sysadmin/logs  Move all your logs here and use cd _logs
SMBSE/user/sysadmin  Your sysadmin stuff go here
SMBSE/user  User
SMBSE/  Main

Most of this directories are easily accesible by using cd _shortNameOfFolder. For example if you run cd _ts you change directory to SMBSE/user/tStorage. Use @help alias to see all the shortcuts to folders.
```

Run js easily from terminal:
```
Run javascript code. Underliying engine is quickjs.
std and os modules are imported by defualt.
Extra run funcion to run commands in a bash subshell.
Examples:
js 'console.log(7 *7);'

js 'let hello = "hello world";
for (let i in hello) {
  console.log(hello[i]);
}'

js 'let httpHeaders = run("curl --silent https://example.com -I");     console.log(httpHeaders)' | grep -i server

js 'let homeFiles = run("ls ~").split("\n");
homeFiles.splice(homeFiles.length - 1);
console.log("Home files in json:\n" + JSON.stringify(homeFiles, null, 2));'
```
  

Run C++ easily from terminal:
```
Run c/c++ code. The code is being embeed inside an int main funcion with return 0, using namespace std and included iostream by default. Then the code is compiled by g++ and runned after.
Examples:
c++ 'cout << 7 * 7;'

c++ '#include <stdio.h>
printf("Hello %s", "world");
'

c++ 'cout << "Hey! how are you?";' | grep -i hey

c++ 'cout << "Need to add more examples xD" << endl;
```

Allows you to modify login message and logout message easily. 

sysinfo cli tool
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
  Baseband:              21C20B388S001C000
  Network Type:          LTE
  Operator:              Movistar
  RIL(radio):            android infineon balong-ril 1.0
  Wi-fi Device Name:     HUAWEI_P40_lite_E-8f0096e
  DNS1:                  80.58.61.254
  DPI:                   272
  Timezone:              Europe/Madrid
  Board:                 ARTHTHD_L29_VA
  Platform:              kirin710
  Build Date:            Tue Dec 22 17,52,35 CST 2020
  Security Patch:        2020-10-01
  SDK Ver:               29
  SDK Min-Ver:           23
```

### What i want it to include in future:
+ More functionality realted to special storage folders. 

+ Include small reference tutorials to each language folder. 

+ Autoupadate and version tracker. 

+ Dependency Manager. 

+ Integrate Proot.

+ Export folders/config to other systems. 

+ Change references to Blue and Green colors for user selected ones.

+ Use true colors if supported
