# --- nnn configuration ---

# nnn cd on quit

n() {
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    # Убедимся, что директория существует (на случай, если её нет)
    mkdir -p "$(dirname "$NNN_TMPFILE")"
    
    command nnn "$@"
    
    if [ -f "$NNN_TMPFILE" ]; then
        source "$NNN_TMPFILE"
        rm -f "$NNN_TMPFILE"
    fi
}


# Colors (8-color palette)
export NNN_COLORS="12345678"

# File colors (LS_COLORS-подобная раскраска)
BLK="0B" CHR="0B" DIR="04" EXE="06" REG="00" HARDLINK="06" SYMLINK="06" MISSING="00" ORPHAN="09" FIFO="06" SOCK="0B" OTHER="06"
export NNN_FCOLORS="$BLK$CHR$DIR$EXE$REG$HARDLINK$SYMLINK$MISSING$ORPHAN$FIFO$SOCK$OTHER"

# Plugins (объединённый список)
export NNN_PLUG='f:finder;o:fzopen;p:preview-tui;d:diffs;v:imgview;u:!udiskie-umount -a;m:udiskie-start'

# GUI / opener
export GUI=1
export DISPLAY=:0
export NNN_OPENER=$HOME/.config/nnn/plugins/nuke   # если файла нет — закомментируйте

# Preview (FIFO + split)
export NNN_FIFO=/tmp/nnn.fifo
export NNN_SPLIT=v
export NNN_SPLITSIZE=80


