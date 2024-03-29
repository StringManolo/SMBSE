# Bash Shell Extension by @StringManolo

# Log activity. Options are CONSOLE, FILE, BOTH, NONE.
#export SMBSE_INTERNAL_LOG="CONSOLE"
export SMBSE_INTERNAL_LOG="CONSOLE"
SMBSE_LOGME() {
  if [ "$SMBSE_INTERNAL_LOG" == "CONSOLE" ]; then
    echo -e "[$(date +%H:%M:%S:%4N)]" "\e[1;32m" $1 "\e[0m";
  fi
}

SMBSE_LOGME "Running \e[1;34mSMBSE 1.0\e[0m\e[1;32m from ~/.bashrc ...";

# if not running interactively, don't do anything
SMBSE_LOGME 'Check if terminal is running interactively.';
case $- in
  *i*) ;;
    *) return;;
esac


SMBSE_LOGME "Running .bashrc";

# don't put duplicate lines or lines starting with space in the history.
SMBSE_LOGME 'Setting history to ignore duplicated lines and lines starting with space';
HISTCONTROL=ignoreboth;

# append to the history file, don't overwrite it
SMBSE_LOGME 'Append to history setted up';
shopt -s histappend;
# share history between shell sessions
SMBSE_LOGME 'Sharing history between terminals';
PROMPT_COMMAND='history -a';

# history length
SMBSE_LOGME 'History size is 10000, file size is 20000';
HISTSIZE=10000;
HISTFILESIZE=20000;
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
SMBSE_LOGME 'Resize setted up';
shopt -s checkwinsize;

# Set enviroment variables
SMBSE_LOGME 'Creating enviroment variables...';
SMBSE="$HOME/SMBSE";
SMBSE_LOGME 'SMBSE, SMBSE_BIN, SMBSE_TMP, SMBSE_VERSION.';
SMBSE_BIN="$SMBSE/bin";
SMBSE_TMP="$SMBSE/.tmp";
SMBSE_VERSION="0.1";
SMBSE_LOGME 'Exporting long SMBSE version and bash version for internal usage';
export SMBSE_VERSION_LONG="SMBSE $SMBSE_VERSION";
export SMBSE_BASH_VERSION="$(help | head -n 1)";
SMBSE_LOGME 'Exporting time to live to temporal storage';
export SMBSE_TTL_TSTORAGE="1" #Time in minutes to delete temporalStorage


# create folders without warnings
SMBSE_LOGME 'Defined createFolder bash function';
createFolder() {
  [ ! -d "$1" ] && mkdir "$1";
}

createFolder $SMBSE;
createFolder $SMBSE_BIN;
createFolder $SMBSE_TMP;
SMBSE_LOGME 'Created enviroment folders';

# Base structure to share between devices
SMBSE_LOGME 'Setting up all file structure variables';
SMBSE_USER="$SMBSE/user";

# programming
# add manuals and links to resources
SMBSE_PROGRAMMING="$SMBSE_USER/programming" # programming examples
SMBSE_PROGRAMMING_ASSEMBLER="$SMBSE_PROGRAMMING/assembler";
SMBSE_PROGRAMMING_BASH="$SMBSE_PROGRAMMING/bash";
SMBSE_PROGRAMMING_C="$SMBSE_PROGRAMMING/c";
SMBSE_PROGRAMMING_Cpp="$SMBSE_PROGRAMMING/cpp";
SMBSE_PROGRAMMING_CSS="$SMBSE_PROGRAMMING/css";
SMBSE_PROGRAMMING_GO="$SMBSE_PROGRAMMING/go";
SMBSE_PROGRAMMING_HTML="$SMBSE_PROGRAMMING/html";
SMBSE_PROGRAMMING_JAVA="$SMBSE_PROGRAMMING/java";
SMBSE_PROGRAMMING_JAVASCRIPT="$SMBSE_PROGRAMMING/javascript";
SMBSE_PROGRAMMING_JAVASCRIPT_BROWSER="$SMBSE_PROGRAMMING_JAVASCRIPT/browser";
SMBSE_PROGRAMMING_JAVASCRIPT_NODE="$SMBSE_PROGRAMMING_JAVASCRIPT/node";
SMBSE_PROGRAMMING_JAVASCRIPT_QJS="$SMBSE_PROGRAMMING_JAVASCRIPT/qjs";
SMBSE_PROGRAMMING_LUA="$SMBSE_PROGRAMMING/lua";
SMBSE_PROGRAMMING_PERL="$SMBSE_PROGRAMMING/perl";
SMBSE_PROGRAMMING_PHP="$SMBSE_PROGRAMMING/php";
SMBSE_PROGRAMMING_PYTHON="$SMBSE_PROGRAMMING/python";
SMBSE_PROGRAMMING_PYTHON2="$SMBSE_PROGRAMMING/python2";
SMBSE_PROGRAMMING_RUBY="$SMBSE_PROGRAMMING/ruby";
SMBSE_PROGRAMMING_SQL="$SMBSE_PROGRAMMING/sql";
SMBSE_PROGRAMMING_TYPESCRIPT="$SMBSE_PROGRAMMING/typescript";
SMBSE_PROGRAMMING_PROJECTS="$SMBSE_PROGRAMMING/projects";
SMBSE_LOGME 'All programming folders DONE';

# hacking
SMBSE_HACKING="$SMBSE_USER/hacking";
SMBSE_HACKING_TOOLS="$SMBSE_HACKING/tools";
SMBSE_HACKING_TOOLS_INFOGATHERING="$SMBSE_HACKING_TOOLS/infogathering";
SMBSE_HACKING_TOOLS_EXPLOITS="$SMBSE_HACKING_TOOLS/exploits";
SMBSE_HACKING_TOOLS_POSTEXPLOITATAION="$SMBSE_HACKING_TOOLS/postexploitation";
SMBSE_HACKING_TOOLS_PERSISTENCE="$SMBSE_HACKING_TOOLS/persistence";
SMBSE_HACKING_TOOLS_BRUTEFORCE="$SMBSE_HACKING_TOOLS/bruteforce";
SMBSE_HACKING_TOOLS_REVERSING="$SMBSE_HACKING_TOOLS/reversing";
SMBSE_HACKING_TOOLS_WIRELESS="$SMBSE_HACKING_TOOLS/wireless";
SMBSE_HACKING_TOOLS_BLACKSEO="$SMBSE_HACKING_TOOLS/blackseo";
SMBSE_HACKING_TOOLS_ANALYSIS="$SMBSE_HACKING_TOOLS/analysis";
SMBSE_HACKING_TOOLS_NOTES="$SMBSE_HACKING_TOOLS/notes";
SMBSE_HACKING_TOOLS_REPORTS="$SMBSE_HACKING_TOOLS/reports";
SMBSE_LOGME 'All hacking folders DONE';


# sysadmin
SMBSE_SYSADMIN="$SMBSE_USER/sysadmin";
SMBSE_SYSADMIN_LOGS="$SMBSE_SYSADMIN/logs";
SMBSE_LOGME 'All sysadmin folders DONE';


# storage
SMBSE_RECYCLEBIN="$SMBSE_USER/recycleBin"; # move here before
SMBSE_RECOVERED="$SMBSE_USER/recovered";
SMBSE_NSTORAGE="$SMBSE_USER/nStorage"; # normal storage
SMBSE_TSTORAGE="$SMBSE_USER/tStorage"; # temporal storage 24h flf
SMBSE_SSTORAGE="$SMBSE_USER/sStorage"; # secure storage
SMBSE_OSTORAGE="$SMBSE_USER/oStorage"; # online hard drive
SMBSE_BSTORAGE="$SMBSE_USER/bStorage"; # backup storage
SMBSE_LOGME 'Recycle Bin and Storage DONE';

SMBSE_LOGME 'Creating all folders...';
createFolderStructure() {
  createFolder $SMBSE_USER;
  createFolder $SMBSE_RECYCLEBIN; # add alias to rm del
  createFolder $SMBSE_RECOVERED;
  createFolder $SMBSE_NSTORAGE;
  createFolder $SMBSE_TSTORAGE;
  createFolder $SMBSE_SSTORAGE;
  createFolder $SMBSE_OSTORAGE;
  createFolder $SMBSE_BSTORAGE;

  createFolder $SMBSE_PROGRAMMING;
  createFolder $SMBSE_PROGRAMMING_ASSEMBLER;
  createFolder $SMBSE_PROGRAMMING_BASH;
  createFolder $SMBSE_PROGRAMMING_C;
  createFolder $SMBSE_PROGRAMMING_Cpp;
  createFolder $SMBSE_PROGRAMMING_CSS;
  createFolder $SMBSE_PROGRAMMING_GO;
  createFolder $SMBSE_PROGRAMMING_HTML;
  createFolder $SMBSE_PROGRAMMING_JAVA;
  createFolder $SMBSE_PROGRAMMING_JAVASCRIPT;
  createFolder $SMBSE_PROGRAMMING_JAVASCRIPT_BROWSER;
  createFolder $SMBSE_PROGRAMMING_JAVASCRIPT_NODE;
  createFolder $SMBSE_PROGRAMMING_JAVASCRIPT_QJS;
  createFolder $SMBSE_PROGRAMMING_LUA;
  createFolder $SMBSE_PROGRAMMING_PERL;
  createFolder $SMBSE_PROGRAMMING_PHP;
  createFolder $SMBSE_PROGRAMMING_PYTHON;
  createFolder $SMBSE_PROGRAMMING_PYTHON2;
  createFolder $SMBSE_PROGRAMMING_RUBY;
  createFolder $SMBSE_PROGRAMMING_SQL;
  createFolder $SMBSE_PROGRAMMING_TYPESCRIPT;
  createFolder $SMBSE_PROGRAMMING_PROJECTS;

  createFolder $SMBSE_HACKING;
  createFolder $SMBSE_HACKING_TOOLS;
  createFolder $SMBSE_HACKING_TOOLS_ANALYSIS;
  createFolder $SMBSE_HACKING_TOOLS_NOTES;
  createFolder $SMBSE_HACKING_TOOLS_REPORTS;
  createFolder $SMBSE_HACKING_TOOLS_INFOGATHERING;
  createFolder $SMBSE_HACKING_TOOLS_EXPLOITS;
  createFolder $SMBSE_HACKING_TOOLS_POSTEXPLOITATAION;
  createFolder $SMBSE_HACKING_TOOLS_PERSISTENCE;
  createFolder $SMBSE_HACKING_TOOLS_BRUTEFORCE;
  createFolder $SMBSE_HACKING_TOOLS_REVERSING;
  createFolder $SMBSE_HACKING_TOOLS_WIRELESS;
  createFolder $SMBSE_HACKING_TOOLS_BLACKSEO;

  createFolder $SMBSE_SYSADMIN;
  createFolder $SMBSE_SYSADMIN_LOGS;
}

createFolderStructure;
SMBSE_LOGME 'All filesystem DONE';

# add custom path to search commands
addPath() {
  if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
    PATH="${PATH:+"$PATH:"}$1";
  fi
}

SMBSE_LOGME 'Adding new bin folder to $PATH DONE';
addPath $SMBSE_BIN;

# term true color
SMBSE_LOGME 'Color auto for [ls,dir,vdir,grep,fgrep,egrep] DONE';
# Add colors before alias
alias ls='ls --color=auto';
alias dir='dir --color=auto';
alias vdir='vdir --color=auto';
alias grep='grep --color=auto';
alias fgrep='fgrep --color=auto';
alias egrep='egrep --color=auto';

# make variables cdable.
SMBSE_LOGME 'Variables are cdable TRUE';
shopt -s cdable_vars;


# Import alias from the file
SMBSE_LOGME 'Checking if SMBSE alias file already exists';
if [ -f "$SMBSE/alias" ]; then
  SMBSE_LOGME 'Alias file found, importing it...';
  . "$SMBSE/alias";
else
  SMBSE_LOGME 'Creating alias file';
  # Create file for alias
  # touch "$SMBSE/alias" 2>&1 > /dev/null;

  # If you want to add alias, do it in the alias file unless -
  # you actually want to add those alias persistenly.
  echo '# Alias file.

alias l='"'"'ls'"'"';
alias la='"'"'ls -a'"'"';
alias v='"'"'vim'"'"'; # ^X ^E to open command in $EDITOR
alias c='"'"'clear'"'"' # ^L if you have a command already writen
alias cl='"'"'clear && ls'"'"'
alias ..='"'"'cd ..'"'"'
alias ...='"'"'cd ../..'"'"'
alias ....='"'"'cd ../../..'"'"'
alias .....='"'"'cd ../../../..'"'"'
alias pserv='"'"'python -m http.server'"'"'
alias gitc='"'"'git clone'"'"'
alias 775='"'"'chmod +775'"'"'
alias folder='"'"'du -h --max-depth=1'"'"'
alias h='"'"'history'"'"'
alias irc='"'"'weechat'"'"'
alias myip='"'"'curl http://ifconfig.me/ip'"'"'
alias quit='"'"'exit'"'"'
alias q='"'"'exit'"'"'
alias sb='"'"'source ~/.bashrc'"'"'
alias update='"'"'apt-get update && apt-get upgrade'"'"'
alias gacp='"'"'SMBSEGACP'"'"'
alias @help='"'"'SMBSEHELP'"'"'
alias sysinfo='"'"'SMBSESYSINFO'"'"'
alias del='"'"'SMBSEDEL'"'"'
alias delete='"'"'SMBSDEL'"'"'
alias recycle='"'"'SMBSERECYCLE'"'"'
alias recover='"'"'SMBSERECOVER'"'"'

# paths, you need shopt -s cdable-vars in .bashrc
_smbse='"'"''"$SMBSE"''"'"'
_user='"'"''"$SMBSE_USER"''"'"'
_rb='"'"''"$SMBSE_RECYCLEBIN"''"'"'
_ns='"'"''"$SMBSE_NSTORAGE"''"'"'
_ts='"'"''"$SMBSE_TSTORAGE"''"'"'
_ss='"'"''"$SMBSE_SSTORAGE"''"'"'
_os='"'"''"$SMBSE_OSTORAGE"''"'"'
_bs='"'"''"$SMBSE_BSTORAGE"''"'"'
_p='"'"''"$SMBSE_PROGRAMMING"''"'"'
_a='"'"''"$SMBSE_PROGRAMMING_ASSEMBLER"''"'"'
_b='"'"''"$SMBSE_PROGRAMMING_BASH"''"'"'
_c='"'"''"$SMBSE_PROGRAMMING_C"''"'"'
_cpp='"'"''"$SMBSE_PROGRAMMING_CPP"''"'"'
_css='"'"''"$SMBSE_PROGRAMMING_CSS"''"'"'
_go='"'"''"$SMBSE_PROGRAMMING_GO"''"'"'
_html='"'"''"$SMBSE_PROGRAMMING_HTML"''"'"'
_java='"'"''"$SMBSE_PROGRAMMING_JAVA"''"'"'
_javascript='"'"''"$SMBSE_PROGRAMMING_JAVASCRIPT"''"'"'
_js='"'"''"$SMBSE_PROGRAMMING_JAVASCRIPT"''"'"'
_browser='"'"''"$SMBSE_PROGRAMMING_JAVASCRIPT_BROWSER"''"'"'
_node='"'"''"$SMBSE_PROGRAMMING_JAVASCRIPT_NODE"''"'"'
_qjs='"'"''"$SMBSE_PROGRAMMING_JAVASCRIPT_QJS"''"'"'
_lua='"'"''"$SMBSE_PROGRAMMING_LUA"''"'"'
_perl='"'"''"$SMBSE_PROGRAMMING_PERL"''"'"'
_php='"'"''"$SMBSE_PROGRAMMING_PHP"''"'"'
_python='"'"''"$SMBSE_PROGRAMMING_PYTHON"''"'"'
_python2='"'"''"$SMBSE_PROGRAMMING_PYTHON2"''"'"'
_ruby='"'"''"$SMBSE_PROGRAMMING_RUBY"''"'"'
_sql='"'"''"$SMBSE_PROGRAMMING_SQL"''"'"'
_pp='"'"''"$SMBSE_PROGRAMMING_PROJECTS"''"'"'
_projects='"'"''"$SMBSE_PROGRAMMING_PROJECTS"''"'"'
_h='"'"''"$SMBSE_HACKING"''"'"'
_ht='"'"''"$SMBSE_HACKING_TOOLS"''"'"'
_htoolS='"'"''"$SMBSE_HACKING_TOOLS"''"'"'
_hanalysis='"'"''"$SMBSE_HACKING_TOOLS_ANALYSIS"''"'"'
_hnotes='"'"''"$SMBSE_HACKING_TOOLS_NOTES"''"'"'
_hreports='"'"''"$SMBSE_HACKING_TOOLS_REPORTS"''"'"'
_hig='"'"''"$SMBSE_HACKING_TOOLS_INFOGATHERING"''"'"'
_hinfo='"'"''"$SMBSE_HACKING_TOOLS_INFOGATHERING"''"'"'
_hexploits='"'"''"$SMBSE_HACKING_TOOLS_EXPLOITS"''"'"'
_hpostexploit='"'"''"$SMBSE_HACKING_TOOLS_POSTEXPLOITATAION"''"'"'
_hpersistence='"'"''"$SMBSE_HACKING_TOOLS_PERSISTENCE"''"'"'
_hbruteforce='"'"''"$SMBSE_HACKING_TOOLS_BRUTEFORCE"''"'"'
_hreversing='"'"''"$SMBSE_HACKING_TOOLS_REVERSING"''"'"'
_hwireless='"'"''"$SMBSE_HACKING_TOOLS_WIRELESS"''"'"'
_hblackseo='"'"''"$SMBSE_HACKING_TOOLS_BLACKSEO"''"'"'

_sysadmin='"'"''"$SMBSE_SYSADMIN"''"'"'
_logs='"'"''"$SMBSE_SYSADMIN_LOGS"''"'"'





# Functions works the same as aliases:

# Help message.

# Upload to github
SMBSEGACP() {
  git add --all && git commit -m "$1" && git push
}

# get last file date inside storage
SMBSEINTERNALTSTORAGEDATE() {
  js '"'"'let dToMins = date => {
    let [h, m] = date.split(":")
    return +m + (+h * 60);
  }

  let removeDuplicatedSpaces = str => {
    while (/  /g.test(str) ) {
      str = str.replaceAll("  ", " ");
    }
    return str;
  }

let numberOfFiles = run(`ls -A '"'"''"$SMBSE_TSTORAGE"''"'"' | wc -l`);
  let last2 = run(`ls -Artl '"'"''"$SMBSE_TSTORAGE"''"'"' | tail -n 2`).split("\n");
  if (numberOfFiles > 1) {
    let fileToCheck = removeDuplicatedSpaces(last2[0]).split(" ");
    let fileToCompare = removeDuplicatedSpaces(last2[1]).split(" ");
    if (fileToCheck[5] != fileToCompare[5]) {
      run(`rm '"'"''"$SMBSE_TSTORAGE/*"''"'"'`);
    } else if (fileToCheck[6] != fileToCompare[6]) {
      run(`rm "'"'"''"$SMBSE_TSTORAGE/*"''"'"'`);
    } else {
      if ( dToMins(fileToCompare[7]) - dToMins(fileToCheck[7]) > std.getenv("SMBSE_TTL_TSTORAGE") ) {
        run(`rm '"'"''"$SMBSE_TSTORAGE/*"''"'"'`);
      }
    }

  }
  '"'"'
}


# remove files from recyclebin
SMBSERECYCLE() {
  rm -r "$SMBSE_RECYCLEBIN/*" 2>&1 > /dev/null;
}

# recover file from recyclebin
SMBSERECOVER() {
    7z x "$SMBSE_RECYCLEBIN/*.7z" -o"$SMBSE_RECOVERED" 2>&1 > /dev/null && rm -r *.7z 2>&1 > /dev/null;
}

# Compress and move files to recyclebin
SMBSEDEL() {
  7z a "$1".7z "$1" -sdel 2>&1 > /dev/null && mv "$1".7z "$SMBSE_RECYCLEBIN" 2>&1 > /dev/null;
  js '"'"'std.out.puts("\n" + new Date() + " deleted from " + os.getcwd()[0])'"'"' >> "$SMBSE_RECYCLEBIN/register.txt" && echo "$1" >> "$SMBSE_RECYCLEBIN/register.txt"
}

# Show system information
SMBSESYSINFO() {
  echo '"'"'.------------------- LINUX ----------------------.
  SMBSE Version:         '"'"'$(echo "$SMBSE_VERSION")'"'"'
  Operative System:      '"'"'$(uname -o)'"'"'
  Kernel Version:        '"'"'$(uname -r)'"'"'
  CPU:                   '"'"'$(js '"'"'let obj = JSON.parse(run("lscpu --json")).lscpu;
  for (let i in obj) {                                                     if(/model name/gi.test(obj[i].field)) {
    console.log(obj[i].data);
  }
}'"'"') '"'"'
  Architecture:          '"'"'$(js '"'"'let obj = JSON.parse(run("lscpu --json")).lscpu;
  for (let i in obj) {                                                     if(/architecture/gi.test(obj[i].field)) {
    console.log(obj[i].data);
  }
}'"'"') '"'"'
  Vendor:                '"'"'$(js '"'"'let obj = JSON.parse(run("lscpu --json")).lscpu;
  for (let i in obj) {                                                     if(/vendor/gi.test(obj[i].field)) {
    console.log(obj[i].data);
  }
}'"'"') '"'"'
  CPU MAX MHz:           '"'"'$(js '"'"'let obj = JSON.parse(run("lscpu --json")).lscpu;
  for (let i in obj) {                                                     if(/max mhz/gi.test(obj[i].field)) {
    console.log(obj[i].data);
  }
}'"'"') '"'"'
  CPU MIN MHz:           '"'"'$(js '"'"'let obj = JSON.parse(run("lscpu --json")).lscpu;
  for (let i in obj) {                                                     if(/min mhz/gi.test(obj[i].field)) {
    console.log(obj[i].data);
  }
}'"'"') '"'"'
  CPU Operation:         '"'"'$(js '"'"'let obj = JSON.parse(run("lscpu --json")).lscpu;
  for (let i in obj) {                                                     if(/cpu op/gi.test(obj[i].field)) {
    console.log(obj[i].data);
  }
}'"'"') '"'"'
  CPU Cores:             '"'"'$(js '"'"'let obj = JSON.parse(run("lscpu --json")).lscpu;
  for (let i in obj) {                                                     if(/CPU\(S\)\:/gi.test(obj[i].field)) {
    console.log(obj[i].data);
  }
}'"'"') '"'"'
  RAM Total:             '"'"'$(js '"'"'const memory = run("cat /proc/meminfo").split("\n");
for (let i in memory) {
  if(/memtotal/gi.test(memory[i])) {
    while(/  /.test(memory[i])) {
      memory[i] = memory[i].replaceAll("  ", " ");
    }
      console.log((+memory[i].split(" ")[1] / 1024 / 1024).toString().substr(0, 5));
  }
}'"'"') '"'"'
  RAM Available:         '"'"'$(js '"'"'const memory = run("cat /proc/meminfo").split("\n");
for (let i in memory) {
  if(/memavailable/gi.test(memory[i])) {
    while(/  /.test(memory[i])) {
      memory[i] = memory[i].replaceAll("  ", " ");
    }
      console.log((+memory[i].split(" ")[1] / 1024 / 1024).toString().substr(0, 5));
  }
}'"'"') '"'"'
  Packages Installed:    '"'"'$(apt list --installed 2> /dev/null | wc -l)'"'"'
  Packages Upgradable:   '"'"'$(apt list --upgradable 2> /dev/null | wc -l)'"'"'
  Public IP:             '"'"'$(curl http://ifconfig.me/ip --silent)'"'"'
  System Started:        '"'"'$(uptime -s)'"'"'

'"'"'
  if [ -f "/system/bin/getprop" ]; then
    echo '"'"'.------------------- ANDROID --------------------.'"'"'
    js '"'"'let apn = run("/system/bin/getprop | grep default.apn | head -n 1"),
    baseband = run("/system/bin/getprop | grep version.baseband | head -n 1"),
    networkType = run("/system/bin/getprop | grep network.type | head -n 1"),
    operatorAlpha = run("/system/bin/getprop | grep operator.alpha | head -n 1"),
    ril = run("/system/bin/getprop | grep version.ril | head -n 1"),
    hostname = run("/system/bin/getprop | grep net.hostname | head -n 1"),
    dns1 = run("/system/bin/getprop | grep .dns1 | head -n 1"),
    dns2 = run("/system/bin/getprop | grep .dns2 | head -n 1"),
    dpi = run("/system/bin/getprop | grep .dpi | head -n 1"),
    timezone = run("/system/bin/getprop | grep .timezone | head -n 1"),
    boardname = run("/system/bin/getprop | grep .boardname | head -n 1"),
    boardPlatform = run("/system/bin/getprop | grep .platform | head -n 1"),
    buildDate = run("/system/bin/getprop | grep build.date | head -n 1"),
    secPatch = run("/system/bin/getprop | grep version.security_patch | head -n 1"),
    verInc = run("/system/bin/getprop | grep version.incre | head -n 1"),
    sdkMinVer = run("/system/bin/getprop | grep version.min_supported_target_sdk | head -n 1"),
    sdkVer = run("/system/bin/getprop | grep version.sdk | head -n 1"),
    model = run("/system/bin/getprop | grep .marketing_name | head -n 1");

    /* TODO: replace .replaces by a function to reduce code size. */
    if (model) {
      console.log(`  Model:                 ${model.split(":").splice(1).toString()
        .replaceAll("[", "")
        .replace(" ", "")
        .replaceAll("]", "")
        .replaceAll("\n", "")
      }`);
    } if (verInc) {
      console.log(`  Version:               ${verInc.split(":").splice(1).toString()
        .replaceAll("[", "")
        .replace(" ", "")
        .replaceAll("]", "")
        .replaceAll("\n", "")
      }`);
    }  if (apn) {
      console.log(`  APN:                   ${apn.split(":").splice(1).toString()
        .replaceAll("[", "")
        .replaceAll(" ","")
        .replaceAll("]", "")
        .replaceAll("\n", "")
      }`);
    } if (baseband) {
      let basebandParsed = baseband.split(":")[1]
        .replaceAll("[", "")
        .replaceAll(" ", "")
        .replaceAll("]", "")
        .replaceAll("\n", "");
      let bbs = basebandParsed.split(",");
      if (bbs.length > 1) {
        if (bbs[0] === bbs[1]) {
          console.log(`  Baseband:              ${bbs[0]}`);
        }
      } else {
        console.log(`  Baseband:              ${basebandParsed}`);
      }
    } if (networkType) {
      console.log(`  Network Type:          ${networkType.split(":").splice(1).toString()
        .replaceAll("[", "")
        .replaceAll(" ", "")
        .replaceAll("]", "")
        .replaceAll(/unknown,/gi, "")
        .replaceAll("\n", "")
      }`);
    } if (operatorAlpha) {
      let opAlphaParsed = operatorAlpha.split(":").splice(1).toString();
      opAlphaParsed = (opAlphaParsed.substr(2,1) == "," ? opAlphaParsed.substring(3) : opAlphaParsed);
      console.log(`  Operator:              ${opAlphaParsed
        .replaceAll("[", "")
        .replaceAll(" ", "")
        .replaceAll("]", "")
        .replaceAll("\n", "")
      }`);
    } if (ril) {
      console.log(`  RIL(radio):            ${ril.split(":").splice(1).toString()
        .replaceAll("[", "")
        .replace(" ", "")
        .replaceAll("]", "")
        .replaceAll("\n", "")
      }`);
    } if (hostname) {
      console.log(`  Wi-fi Device Name:     ${hostname.split(":").splice(1).toString()
        .replaceAll("[", "")
        .replace(" ", "")
        .replaceAll("]", "")
        .replaceAll("\n", "")
      }`);
    } if (dns1) {
      console.log(`  DNS1:                  ${dns1.split(":").splice(1).toString()
        .replaceAll("[", "")
        .replace(" ", "")
        .replaceAll("]", "")
        .replaceAll("\n", "")
      }`);
    } if (dns2) {
      console.log(`  DNS2:                  ${dns2.split(":").splice(1).toString()
        .replaceAll("[", "")
        .replace(" ", "")
        .replaceAll("]", "")
        .replaceAll("\n", "")
      }`);
    } if (dpi) {
      console.log(`  DPI:                   ${dpi.split(":").splice(1).toString()
        .replaceAll("[", "")
        .replace(" ", "")
        .replaceAll("]", "")
        .replaceAll("\n", "")
      }`);
    } if (timezone) {
      console.log(`  Timezone:              ${timezone.split(":").splice(1).toString()
        .replaceAll("[", "")
        .replace(" ", "")
        .replaceAll("]", "")
        .replaceAll("\n", "")
      }`);
    } if (boardname) {
      console.log(`  Board:                 ${boardname.split(":").splice(1).toString()
        .replaceAll("[", "")
        .replace(" ", "")
        .replaceAll("]", "")
        .replaceAll("\n", "")
      }`);
    } if (boardPlatform) {
      console.log(`  Platform:              ${boardPlatform.split(":").splice(1).toString()
        .replaceAll("[", "")
        .replace(" ", "")
        .replaceAll("]", "")
        .replaceAll("\n", "")
      }`);
    } if (buildDate) {
      console.log(`  Build Date:            ${buildDate.split(":").splice(1).toString()
        .replaceAll("[", "")
        .replace(" ", "")
        .replaceAll("]", "")
        .replaceAll("\n", "")
      }`);
    } if (secPatch) {
      console.log(`  Security Patch:        ${secPatch.split(":").splice(1).toString()
        .replaceAll("[", "")
        .replace(" ", "")
        .replaceAll("]", "")
        .replaceAll("\n", "")
      }`);
    } if (sdkVer) {
      console.log(`  SDK Ver:               ${sdkVer.split(":").splice(1).toString()
        .replaceAll("[", "")
        .replace(" ", "")
        .replaceAll("]", "")
        .replaceAll("\n", "")
      }`);
    } if (sdkMinVer) {
      console.log(`  SDK Min-Ver:           ${sdkMinVer.split(":").splice(1).toString()
        .replaceAll("[", "")
        .replace(" ", "")
        .replaceAll("]", "")
        .replaceAll("\n", "")
      }`);
    }


'"'"'
  fi
}


# Extracts any archive(s) (if unp isn'"'"'t installed)
extract() {
  for archive in $*; do
    if [ -f $archive ] ; then
      case $archive in
        *.tar.bz2) tar xvjf $archive ;;
        *.tar.gz) tar xvzf $archive ;;
        *.bz2) bunzip2 $archive ;;
        *.rar) rar x $archive ;;
        *.gz) gunzip $archive ;;
        *.tar) tar xvf $archive ;;
        *.tbz2) tar xvjf $archive ;;
        *.tgz) tar xvzf $archive ;;
        *.zip) unzip $archive ;;
        *.Z) uncompress $archive ;;
        *.7z) 7z x $archive ;;
        *) echo "don'"'"'t know how to extract '"'"'$archive'"'"'..." ;;
      esac
    else
      echo "'"'"'$archive'"'"' is not a valid file!"
    fi
  done
}

  ' > "$SMBSE/alias";
  SMBSE_LOGME 'Alias file created sucesfully. Importing alias...';
  . "$SMBSE/alias";
fi
  SMBSE_LOGME 'Alias import DONE';

# Import logout from the file
SMBSE_LOGME 'Checking if SMBSE logout file already exists';
if [ -f "$SMBSE/logout" ]; then
  SMBSE_LOGME 'Logout file found, importing it';
  . "$SMBSE/logout";
  SMBSE_LOGME 'Logout import DONE';
else
  # Create file for logout
  SMBSE_LOGME 'Creating logout file';
  # touch "$SMBSE/logout" 2>&1 > /dev/null
  echo 'logout() {
  echo ${green};
  clear;
  typewrite '"'"'Closing shell'"'"' 1;
  typewrite '"'"'..'"'"' 180;
  typewrite '"'"'.'"'"' 300;
  echo ${endc}
  clear;
}

trap logout EXIT;' > "$SMBSE/logout";
  SMBSE_LOGME 'Logout file created sucesfully. Importing logout...';
  . "$SMBSE/logout";
  SMBSE_LOGME 'Logout import DONE';
fi


# Set qjs as javascript main engine to run some scripts
SMBSE_LOGME 'Setting quickjs as javascript engine';
SMBSE_JSENGINE='qjs'

# Test if qjs exists, else download and install it
testIfJsEngineAvailable() {
  qjs -q 2>&1 > /dev/null || (echo "Downloading quickjs, wait please..."; curl --silent 'https://bellard.org/quickjs/binary_releases/quickjs-linux-x86_64-2020-11-08.zip' -o "$SMBSE_TMP/qjs_zip_first_install" 2>&1 1> /dev/null && unzip "$SMBSE_TMP/qjs_zip_first_install" -d "$SMBSE_TMP" 2>&1 1> /dev/null && cp "$SMBSE_TMP/qjs" "$SMBSE_BIN/qjs" 2>&1 1> /dev/null && rm -r "$SMBSE_TMP" 2>&1 1> /dev/null && createFolder "$SMBSE_TMP")
}

SMBSE_LOGME 'Test if qjs exists, else, download and install it.';
testIfJsEngineAvailable;


# Set the defualt editor
SMBSE_LOGME 'Setting vim as default text editor.';
export EDITOR='vim'

# Set auto cd
SMBSE_LOGME 'Setting autocd';
shopt -s autocd

# define colors

export red=$'\e[1;31m';
export green=$'\e[1;32m';
export yellow=$'\e[1;33m';
export blue=$'\e[1;34m';
export cyan=$'\e[1;35m';
export white=$'\e[1;37m';
export endc=$'\e[0m';
export lightgray=$'\e[0;37m';
export black=$'\e[0;30m';
export darkgray=$'\e[1;30m';
export darkred=$'\e[0;31m';
export darkgreen=$'\e[0;32m';
export darkyellow=$'\e[0;33m';
export darkblue=$'\e[0;34m';
export magenta=$'\e[0;35m';
export darkcyan=$'\e[0;36m';
export underlinedarkgray=$'\e[0;30m';

SMBSE_LOGME "Exporting [${red}red${endc}, ${green}green${endc}, ${yellow}yellow${endc}, ${blue}blue${endc}, ${cyan}cyan${endc}, ${white}white${endc}, ${lightgray}lightgray${endc}, ${black}black${endc}, ${darkgray}darkgray${endc}, ${darkred}darkred${endc}, ${darkgreen}darkgreen${endc}, ${darkyellow}darkyellow${endc}, ${darkblue}darkblue${endc}, ${magenta}magenta${endc}, ${darkcyan}darkcyan${endc}, ${underlinedarkgray}underlinedarkgray${endc}${green}] colors to terminal";

# Custom Console
SMBSE_LOGME 'Setting PS1 and PS2 terminal indicators'
PS1='\n\n${underlinedarkgray}${darkgray}(${blue}$(date +%H${darkgray}:${blue}%M${darkgray}:${blue}%S${darkgray}:${blue}%4N)${darkgray}) ${green}$(pwd)${endc}\n> ';

#PS1='\n\n[${blue}$(date +%H${endc}:${blue}%M${endc}:${blue}%S${endc}:${blue}%4N)${endc}] ${green}$(pwd)${endc}\n${blue}>${endc} '
PS2='${blue}.${endc}  ';

# Extra binaries file
SMBSE_LOGME 'Testing if SMBSE extra binaries file exists';
if [ -f "$SMBSE/extras" ]; then
  SMBSE_LOGME 'Extras file found, importing it';
  . "$SMBSE/extras";
  SMBSE_LOGME 'Extra file import DONE';
else
  SMBSE_LOGME 'Creating extra file';
  echo '# This file have some extra binaries that dosn'"'"'t fit into /bin

# Run javascript using js command
echo '"'"'import * as std from "std";
import * as os from "os";

let run = command => {
  let p = std.popen(command, "r"),
  msg = "",
  r = "";
  while(( r = p.getline() ) != null) {
    msg += r + "\n";
  }
  return msg;
}

let javascriptFunctions = `import * as std from "std";
import * as os from "os";

let run = command => {
  let p = std.popen(command, "r"),
  msg = "",
  r = "";
  while(( r = p.getline() ) != null) {
    msg += r + "\\n";
  }
  return msg;
}
`;

let result ="";
try {
  let fd = std.open(".internalJsEvaling", "w+");
  fd.puts(`${javascriptFunctions}${scriptArgs.splice(1,1)}`);
  fd.close();
  result = run(`qjs .internalJsEvaling 2>&1`);
  run("rm .internalJsEvaling");

} catch(err) {
  result = `Error running the code: ${err}`;
}

console.log(result);'"'"' > "$SMBSE_BIN/.js";
js() {
  qjs "$SMBSE_BIN/.js" "$1";
}

# run c++ using c++ command
echo '"'"'import * as std from "std";
import * as os from "os";

let run = command => {
  let p = std.popen(command, "r"),
  msg = "",
  r = "";
  while(( r = p.getline() ) != null) {
    msg += r + "\n";
  }
  return msg;
}

const cppFunctions = `#include <iostream>
using namespace std;

int main(int argv, char *argc[]) {

`;

let result ="";
try {
  let fd = std.open(".internalCppEvaling.cpp", "w+");
  fd.puts(`${cppFunctions}${scriptArgs.splice(1,1)}
return 0;
}`);
  fd.close();
  result = run(`g++ -o .internalCppEvaling.cpp .internalCppEvaling.cpp 2>&1 > /dev/null && chmod +775 .internalCppEvaling.cpp 2>&1 > /dev/null && ./.internalCppEvaling.cpp 2>&1 `);
  run("rm .internalCppEvaling.cpp && 2>&1 > /dev/null");

} catch(err) {
  result = `Error running the code: ${err}`;
}

console.log(result);'"'"' > "$SMBSE_BIN/.cpp";
c++() {
  qjs "$SMBSE_BIN/.cpp" "$1";
}

# Enable typewriter effect

echo '"'"'import * as std from "std";
import * as os from "os";

let sm = {};
sm.log = (msg, delay = 100) => {
  for (let i in msg) {
    if (delay) {
      os.sleep(delay)
    }
  std.out.puts(msg[i]);
  std.out.flush();
  }
}

sm.log(scriptArgs[1], scriptArgs[2]);

'"'"' > "$SMBSE_BIN/.typewrite.js";
typewrite() {
  qjs "$SMBSE_BIN/.typewrite.js" "$1" "$2";
}

# Help function
echo '"'"'import * as std from "std";
import * as os from "os";

let run = command => {
  let p = std.popen(command, "r"),
  msg = "",
  r = "";
  while(( r = p.getline() ) != null) {
    msg += r + "\n";
  }
  return msg;
}

let cli = {};
const C = {
  RED: "\x1b[31m",
  RESET: "\x1b[0m",
  YELLOW:"\x1b[33m",
  BLUE: "\x1b[1;34m",
  GREEN: "\x1b[32m"
};


for(let i in scriptArgs) {
  let arg = scriptArgs[i];
  let nArg = scriptArgs[+i + 1];
  switch(arg) {
    case "alias":
      console.log(`l          ls
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

      `);
    std.exit();

    case "autocd":
      console.log(`You can skip cd in case the argument is a folder and not a command or an alias.

before: cd ~/SMBSE
after: ~/SMBSE`);
      std.exit();

    case "bin":
      console.log(`There is an extra bin folder under the path ~/SMBSE/bin
Bin folder is there for you to add your commands, scripts and binaries. Intended to split system binaries from user defined binaries. You can use binaries in the bin folder same as if they where inside ~/../usr/bin`);
      std.exit();

    case "c++":
    case "cpp":
    case "c":
      console.log(`Run c/c++ code. The code is being embeed inside an int main funcion with return 0, using namespace std and included iostream by default. Then the code is compiled by g++ and runned after.
Examples:
c++ '"'\"'\"'"'cout << 7 * 7;'"'\"'\"'"'

c++ '"'\"'\"'"'#include <stdio.h>
printf("Hello %s", "world");
'"'\"'\"'"'

c++ '"'\"'\"'"'cout << "Hey! how are you?";'"'\"'\"'"' | grep -i hey

c++ '"'\"'\"'"'cout << "Need to add more examples xD" << endl;
`);

      std.exit();


    case "extract":
      console.log(`Extract from common files (based on file extension),
tar.bz2, tar.gz, bz2, rar, .gz, tar, tbz2, tgz, zip, Z, 7z`);
      std.exit();


    case "filesystem":
      console.log(`SMBSE/bin  Use this folder to add commands and scripts you make. Good way to split system binaries from your own binaries.

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
`);
      std.exit();

    case "js":
      console.log(`Run javascript code. Underliying engine is quickjs.
std and os modules are imported by defualt.
Extra run funcion to run commands in a bash subshell.
Examples:
js '"'\"'\"'"'console.log(7 *7);'"'\"'\"'"'

js '"'\"'\"'"'let hello = "hello world";
for (let i in hello) {
  console.log(hello[i]);
}'"'\"'\"'"'

js '"'\"'\"'"'let httpHeaders = run("curl --silent https://example.com -I");
console.log(httpHeaders)'"'\"'\"'"' | grep -i server

js '"'\"'\"'"'let homeFiles = run("ls ~").split("\\n");
homeFiles.splice(homeFiles.length - 1);
console.log("Home files in json:\\n" + JSON.stringify(homeFiles, null, 2));'"'\"'\"'"'
`);
      std.exit();

    case "logout":
      console.log(`SMBSE/logout file have a logout bash funcion that is being called when you start a shell setting a trap.

The trap is thrown when you logout from the shell. For example writting exit.

This file exists in case you want to modify it and include your own logout text, command or bash code to do something before logout.
`);
      std.exit();

    case "motd":
      console.log(`SMBSE/motd file have a SMBSE_FUNCTION_MOTD() bash funcion that is being called when you start a shell.

This file exists in case you want to modify it and include your own welcome text, command or bash code to do something when you open a shell.
`);
      std.exit();
    case "sysinfo":
      console.log(`sysinfo command show you information from the system. If your system is Android, show also extra information.`);
      std.exit();

    case "typewrite":
      console.log(`typewrite command printf each character with specified delay.

Examples:
typewrite '"'\"'\"'"'Hello!'"'\"'\"'"' 100

headers=$(curl https://example.com --silent -I) && typewrite "$headers" 200                                                                   `);
      std.exit();

  }
}



if (!Object.keys(cli).length) {
  console.log(`${std.getenv("SMBSE_BASH_VERSION").replace("unknown", `${C.BLUE}smbse${C.RESET}`)} ${std.getenv("SMBSE_VERSION_LONG")}
These shell commands are defined internally.  Type '"'\"'\"'"'@help'"'\"'\"'"' to see this list.
Type '"'\"'\"'"'@help name'"'\"'\"'"' to find out more about the function '"'\"'\"'"'name'"'\"'\"'"'.

  alias              autocd
  bin                c++
  extract            filesystem
  js                 logout
  motd               sysinfo
  typewrite

`);
  std.exit(0);
}



'"'"' > "$SMBSE_BIN/.help.js";
@help() {
  qjs "$SMBSE_BIN/.help.js" $1 $2;
}


' > "$SMBSE/extras";
  SMBSE_LOGME 'Extras file created sucefully, importing...';
  . "$SMBSE/extras";
  SMBSE_LOGME 'Extras file import DONE';
fi

SMBSE_LOGME 'Exporting color green to man';
# Color for manpages
   export LESS_TERMCAP_mb=${green};
   export LESS_TERMCAP_md=${green};
   # export LESS_TERMCAP_me=${white};
   # export LESS_TERMCAP_se=${blue};
   # export LESS_TERMCAP_so=${blue};

 # Delete the files inside TSTORAGE if enought time passed by from last file modification inside the folder.
SMBSE_LOGME 'Checking temporal files under TSTORAGE';
SMBSEINTERNALTSTORAGEDATE;



# Custom Welcome Msg
SMBSE_LOGME 'Checking if internal logging is set to NONE';
if [ "$SMBSE_INTERNAL_LOG" == "NONE" ]; then
  SMBSE_LOGME 'Clearing console';
  clear
fi

SMBSE_LOGME 'Checking if SMBSE motd file exists';
if [ -f "$SMBSE/motd" ]; then
  SMBSE_LOGME 'SMBSE motd found';
  SMBSE_LOGME 'Checking if $PREFIX/etc/motd file exists';
  if [ -f "$PREFIX/etc/motd" ]; then
    SMBSE_LOGME '$PREFIX/etc/motd file found';
    SMBSE_LOGME 'Making backup and removing original...';
    cp "$PREFIX/etc/motd" "$PREFIX/etc/motd~" 2>&1 > /dev/null && rm "$PREFIX/etc/motd" 2>&1 > /dev/null;
  fi
  SMBSE_LOGME 'Importing SMBSE motd file';
  . "$SMBSE/motd"
  SMBSE_LOGME 'Calling SMBSE motd function';
  SMBSE_FUNCTION_MOTD;

else
  # If you want to edit the welcome message, change the generated motd file.
  echo '# This file is the function outputing the welcome message.

SMBSE_FUNCTION_MOTD() {
  echo "





      ${green}.------------------------------------------------------.${endc}
      ${green}¦                                                      ¦${endc}
      ${green}¦${endc}     Welcome to Linux ${blue}SMBSE${endc} edition!                  ${green}¦${endc}
      ¦                                                      ${green}¦${endc}
      ¦     This version include:                            ${green}¦${endc}
      ¦      - Extra packages     - Predefined Alias         ¦
      ¦      - Custom Settings    - Programming Languages    ¦
      ¦                                                      |
      ¦     Custom filesystem:                               |
      ¦      - Recyclebin                                    ¦
      ¦                                                      ¦
      ¦     Predefined Alias:                                ¦
      ¦      * c:   clear         * ..:    cd ..             ¦
      ¦      * l:   ls            * ...:   cd ../..          ¦
      ¦      * v:   vim           * ....:  cd ../../..       ¦
      ¦                                                      ¦
      ¦     Custom Settings:                                 ¦
      ¦      - Extended History Length    - Autocd           ¦
      ¦      - Auto colors                - Custom PS1       ¦
      ¦                                                      ¦
      ¦     Programming Languages:                           ¦
      ¦                                                      ¦
      ¦     > js '"'"'console.log(new Date())'"'"';                  ¦
      ¦     > c++ '"'"'#include <stdio.h>                        ¦
      ¦            printf("Hell%c", 'o');'"'"'                       ¦
      ¦                                                      ¦"
    #.------------------------------------------------------."
  typewrite '"'"'      .------------------------------------------------------.
















'"'"' 5;
  echo "  use ${green}@help${endc} command!"
}' > "$SMBSE/motd";
  . "$SMBSE/motd";
  SMBSE_FUNCTION_MOTD;
fi
