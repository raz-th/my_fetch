#!/bin/bash

USER=$(whoami)
HOST=$(hostname)
OS=$(grep PRETTY_NAME /etc/os-release | cut -d= -f2 | tr -d '"')
KERNEL=$(uname -r)
UPTIME=$(uptime -p)
CPU=$(lscpu | grep "Model name" | sed 's/Model name:[ \t]*//')
MEM=$(free -h | awk '/Mem:/ {print $3 "/" $2}')
TERMINAL=$(basename "$TERM_PROGRAM" 2>/dev/null || echo "gnome-terminal")
SHELL=$(basename "$SHELL")
RESOLUTION=$(xdpyinfo | awk '/dimensions/{print $2}')
DE="$XDG_CURRENT_DESKTOP"

RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
MAGENTA="\e[35m"
CYAN="\e[36m"
RESET="\e[0m"

INFO=(
	""
	""
	""
  "${CYAN}${USER}@${HOST}${RESET}"
  "line"
  "${RED}OS${RESET}:        $OS"
  "${RED}Kernel${RESET}:    $KERNEL"
  "${RED}Shell${RESET}:     $SHELL"
  "${RED}Resolution${RESET}: $RESOLUTION"
  "${RED}Terminal${RESET}:  $TERMINAL"
  "${RED}User${RESET}:      $USER"
  "${RED}Uptime${RESET}:    $UPTIME"
  "${RED}CPU${RESET}:       $CPU"
  "${RED}Memory${RESET}:    $MEM"
)


readarray -t ART <<'EOF'
⠀⠀⠀⠀⠀⣀⣀⣀⡀⠀⠀⠀⠀⠀⠀⠀⢀⣀⡤⠴⠖⠒⠒⠒⢒⠒⠶⠤⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⢀⣴⠻⣉⢏⣽⣿⣗⣦⠀⠀⢀⡶⠞⠋⠅⠐⠀⢀⠐⠠⠈⠄⠌⠠⢡⢀⠊⠝⡲⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⢠⡿⣼⣣⣼⣿⣿⣿⣿⢳⣝⡷⢋⠄⠈⢀⠄⠈⡀⠂⠌⠠⣑⣈⣄⠃⠢⢌⢸⡶⣥⣊⠽⣦⡀⠀⠀⠀⠀⣀⣠⣤⣀⡀⠀⠀⠀⠀
⠀⣸⣳⢹⣿⣿⣿⡿⡿⠓⣠⠏⡀⠁⠀⡀⠡⢀⠂⠄⡡⢈⡾⠙⢿⣿⣮⡵⣈⢹⣀⣿⣿⡖⣌⢻⡄⡠⢖⠋⠣⢈⣀⢈⡩⢓⢄⠀⠀
⠀⢻⡬⣿⣿⣿⠟⠁⠀⢰⠃⠌⠀⠀⠌⡀⢁⠂⢌⠂⡅⢂⣧⣀⣸⣿⣿⣿⡠⢍⡝⡿⢿⣉⠖⡬⠋⠔⢉⣴⢚⣭⣬⣧⣽⡣⣍⢷⠀
⠀⠸⣗⣿⡿⠀⠀⠀⠀⡏⠰⠀⠀⠰⢀⠐⠠⠊⢄⢊⠰⣁⠚⢿⣿⣿⣿⢟⡋⢖⡸⣐⢣⡜⡘⢁⠐⡲⢏⣶⣿⣿⣿⣿⣽⣻⣆⠧⡇
⠀⠀⠹⣿⣷⠀⠀⠀⣸⡟⠠⡀⠀⠠⢀⢊⠐⡁⢎⠠⢃⠦⣉⠦⣅⠻⣃⢧⡙⢆⡳⣌⢣⠼⢁⠢⣱⡙⣾⣿⣿⣿⣿⣿⣿⣳⢿⡘⡅
⠀⠀⠀⠀⠀⠀⠀⠀⠸⡇⠀⡈⠄⠄⠌⡄⢊⠰⣈⢌⢣⢒⡡⠲⣌⢣⡓⢦⡙⣎⠶⣡⢏⡒⠌⢆⢧⣹⣿⣿⣿⣿⣿⣿⣿⢯⣿⡐⡇
⠀⠀⠀⠀⠀⠀⠀⠀⠀⣧⠈⣄⠐⡈⠔⣀⢃⠒⡌⠆⢎⢢⡑⠳⣌⢳⡘⣣⢝⣢⢛⡴⢣⢍⡚⡜⣢⢽⣿⣿⣿⣿⣿⣿⣿⣻⠆⣱⠃
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣧⠘⡷⢦⣂⠰⣈⠒⣌⠸⢌⠦⣙⡱⢜⡢⡝⢦⢫⡔⣣⢜⡣⢎⡵⣸⢡⠞⣿⣿⣿⣿⣿⣟⡾⢣⣸⠃⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢘⣧⡈⢳⣭⢻⣴⢡⣦⣃⣮⣜⣤⢳⣡⢳⡙⣎⣵⣘⣦⣋⣶⣩⣽⣇⡞⣜⢲⣙⢻⠙⡞⡁⣔⣷⠁⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣶⣙⠿⣯⣿⡾⣽⢷⢯⣿⣯⢿⢯⣿⣝⣷⣟⣾⣻⣶⡿⠛⠙⠻⣿⣷⣛⣮⣿⣶⠿⠋⠁⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣋⢿⣿⣎⣙⠻⡟⢏⡟⡾⣏⡟⡞⢷⢋⢷⣹⣶⠿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⢿⣿⣿⣿⣾⣶⣾⣴⢬⠮⠽⠖⠛⠋⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣟⡻⠿⣿⠿⠿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡇⠉⣓⡏⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⡀⠀⢧⡏⡅⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⡇⠀⡧⣧⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⣴⣿⣿⡿⣿⣿⣷⣦⣷⠁⢹⣹⣴⣾⣿⣿⣿⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⢼⣿⣯⣿⣿⣾⣟⣿⣿⣇⡊⠵⢿⣿⣳⣿⣾⣟⣿⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⢀⡼⢫⢍⣰⣠⢬⠭⢿⣿⣿⣎⡉⡞⢿⣿⣷⡿⠿⠭⡭⣍⣫⢙⡛⣢⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⢀⡿⣌⠣⢆⡇⡓⣎⡱⢃⢦⡙⢿⣶⣽⡿⢫⡔⢎⡵⢣⡑⣎⢒⠧⡱⢆⡭⢧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⢸⡳⣌⣛⢦⢳⡹⢤⠳⣍⠶⣙⣾⡟⠹⣷⣧⢚⡵⣊⢧⡹⣌⢏⡞⣱⢋⡖⣻⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠘⢷⡜⡜⣎⠳⣜⢣⡛⣬⢳⣽⠞⠀⠀⠈⠛⠿⣶⣭⣖⣣⢝⠮⡜⣥⠯⠞⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠙⠉⠮⠵⠌⠗⠯⠾⠛⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
EOF

ART_WIDTH=45
ADD_SPACE=5

for ((i=0; i<${#ART[@]} || i<${#INFO[@]}; i++)); do
    printf "%-${ART_WIDTH}s " "${ART[$i]:-}"
    for ((j=0; j<ADD_SPACE; j++)); do
            printf " "
    done
    if [[ "${INFO[$i]}" == "line" ]]; then
        clean_text=$(echo -e "${INFO[$i-1]}" | sed 's/\x1b\[[0-9;]*m//g')
        len=${#clean_text}
        
        # Fallback if length is 0
        ((len <= 0)) && len=20

        for ((j=0; j<len; j++)); do
            printf "-"
        done
        # printf "\n"
    else 
        printf "${INFO[$i]:-}"
    fi
    printf "\n"
done

