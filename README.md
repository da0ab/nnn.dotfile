# nnn.dotfile
my nnn

                              
```                              
 /███████  /███████  /███████ 
| ██__  ██| ██__  ██| ██__  ██
| ██  \ ██| ██  \ ██| ██  \ ██
| ██  | ██| ██  | ██| ██  | ██
| ██  | ██| ██  | ██| ██  | ██
|__/  |__/|__/  |__/|__/  |__/
                              
```                              
## Помним

**Space**  -  выделить файл

**a** - выделить все файлы

**A** -  инвертировать выделение

Переместиться в нужную папку и на  выбор

**v** -  переместить 

**p**  -  вставить



## Зависимости
``
sudo apt install build-essential pkg-config libncursesw5-dev libreadline-dev
``

## Клонировать и собрать
```
git clone https://github.com/jarun/nnn.git

cd nnn

make  O_NERD=1

sudo make install
```

## Создать структуру папок
``
mkdir -p ~/.config/nnn/plugins
``

## Плагины
``
sh -c "$(curl -Ls https://raw.githubusercontent.com/jarun/nnn/master/plugins/getplugs)"
``

## arhive
``
sudo apt install atool unzip zip p7zip-full unrar tar gzip bzip2 xz-utils
``
## Автомонтирование
``
sudo apt install udiskie
``

``
export NNN_PLUG='m:udiskie-start;u:nmount'
``
chmod +x ~/.config/nnn/plugins/udiskie-start
```
#!/usr/bin/env sh

# Проверяем, не запущен ли уже udiskie
if ! pgrep -x "udiskie" > /dev/null; then
    udiskie &
    # Можно добавить уведомление
    notify-send "udiskie" "Демон автомонтирования запущен"
else
    notify-send "udiskie" "Уже запущен"
fi
```

## nuke
```
EDITOR=nvim
export EDITOR
    ### HTML - открываем в Firefox ###
    htm|html|xhtml)
        if [ "$GUI" = "1" ] && [ -n "$DISPLAY" ]; then
            # Пробуем Firefox
            if command -v firefox >/dev/null 2>&1; then
                (firefox "$FPATH" &) >/dev/null 2>&1
                echo "Открываю в Firefox: $FPATH"  # опционально
                exit 0
            else
                (xdg-open "$FPATH" &) >/dev/null 2>&1
                exit 0
            fi
        else
            # Если нет GUI - текстовый просмотр
            if command -v w3m >/dev/null 2>&1; then
                w3m -dump "$FPATH" | less
                exit 0
            else
                cat "$FPATH"
                exit 0
            fi
        fi
        ;; 
```

## bashrc 

```

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
``
