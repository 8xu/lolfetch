black="30m"
red="31m"
green="32m"
yellow="33m"
blue="34m"
magenta="35m"
cyan="36m"

## Configuration:
    # Change the text color to your preferred color  
    color=$yellow

    # Change the ASCII art color to your preferred color
    # Changing this to $color will make all the colors be the same
    ascii_color=$red

    # Plays a little sound when running the command
    sound= false

    # ASCII art file
    art="art.txt"

    # Clearning screen when running the command
    clear = true

if $clear; then
    clear
fi


remove() {
    q="$1"
    q1=${q//\"/} # Will remove `"` from the q string
    echo -e "${q1//\'/}"
}

OS_RELEASE_PATH="/etc/os-release"
OS_RELEASE_DATA=`cat $OS_RELEASE_PATH`
OS_PRETTY_NAME_VAR=`grep '^PRETTY_NAME' $OS_RELEASE_PATH`
OS_PRETTY_NAME="${OS_PRETTY_NAME_VAR//PRETTY_NAME=/}"
OS_PRETTY_NAME_VALUE=`remove $OS_PRETTY_NAME`

KERNEL=`uname -r`

ASCII=`cat $art`
write() {
    printf "\e[$ascii_color$ASCII\n\n"
    echo -e "           \e[$color User: \e[0m$USER"
    echo -e "           \e[$color Home: \e[0m$HOME"
    echo -e "           \e[$color Distro: \e[0m$OS_PRETTY_NAME_VALUE"
    echo -e "           \e[$color Kernel: \e[0m$KERNEL"
    echo -e "           \e[$color Hostname: \e[0m$HOSTNAME"
    echo -e "           \e[$color Shell: \e[0m$SHELL"
    if $sound; then
        echo -e "\a"
    fi
}   

write