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


## Зависимости
``
sudo apt install build-essential pkg-config libncursesw5-dev libreadline-dev
``

## Клонировать и собрать
``
git clone https://github.com/jarun/nnn.git
cd nnn
make  O_NERD=1
sudo make install
``

## Создать структуру папок
``
mkdir -p ~/.config/nnn/plugins
``

## Плагины
sh -c "$(curl -Ls https://raw.githubusercontent.com/jarun/nnn/master/plugins/getplugs)"

## arhive

``
sudo apt install atool unzip zip p7zip-full unrar tar gzip bzip2 xz-utils
``



# nuke
``
EDITOR=nvim
export EDITOR
``
``
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
``

# bashrc
``
# NNN cd on quit

n() {
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # Запускаем nnn с загрузкой сессии default
    nnn -x -s default "$@"

    # Если есть файл с последней директорией - переходим в неё
    if [ -f "$NNN_TMPFILE" ]; then
        source "$NNN_TMPFILE"
        rm -f "$NNN_TMPFILE"
    fi
}
export NNN_OPTS=""
unset NNN_OPTS
export NNN_COLORS="12345678"

export NNN_PLUG='f:finder;o:fzopen;p:preview-tui;d:diffs;t:nmount;v:imgview'
export GUI=1
export DISPLAY=:0
export NNN_OPENER=$HOME/.config/nnn/plugins/nuke

# FIFO для передачи информации о hover-файле в превьювер
export NNN_FIFO=/tmp/nnn.fifo
# Настройки preview-tui
export NNN_SPLIT=v 
export NNN_SPLITSIZE=80          
``
