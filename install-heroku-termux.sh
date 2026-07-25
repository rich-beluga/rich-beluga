# Установка Heroku Userbot в Termux / Heroku Userbot installer for Termux
# by rich_beluga (Telegram: @rich_beluga)

echo -e '\e[1mHeroku userbot installer'
echo -e ' \e[2m by \e[1mrich_beluga\e[0m'
echo -e ' \e[1m My \e[38;2;131;176;255mTelegram:\e[0m \e[1m@rich_beluga'
echo -e '  \e[2m---------\e[0m'

environment() {
    echo -e ' \e[1m Checking environment...\e[0m'
    cat /etc/os-release &> /dev/null || return 1
    echo -e '  \e[2m---------\e[0m'
}

check() {
    echo -e ' \e[1m Checking packages...\e[0m'
    apt update > /dev/null || return 1
    apt install python3 python3-pip python3-venv git -y > /dev/null || return 1
    echo -e '  Packages installed \e[1;38;2;186;255;154msuccessfully\e[0m'
    which python3 > /dev/null || return 1
    echo -e '  \e[2m---------\e[0m'
}

install() {
    echo -e ' \e[1m Installing dependencies...\e[0m'
    [ -d Heroku ] || git clone https://github.com/coddrago/Heroku &> /dev/null || return 1
    echo -e '  \e[1m Just wait...\e[0m'
    # creating virtual environment (venv)
    python3 -m venv .venv || return 1
    source .venv/bin/activate || return 1
    cd Heroku || return 1
    pip install -r requirements.txt > /dev/null || return 1
    echo -e '  Requirements installed \e[1;38;2;186;255;154msuccessfully\e[0m'
    echo -e '  \e[2m---------\e[0m'
}

start() {
    echo -e ' \e[1m Heroku userbot installed, please run \e[33msource .venv/bin/activate ; cd ~/Heroku ; python3 -m heroku --no-web --root\e[0m'
    # '--no-web' - to avoid problems with code delivery
    # '--root'   - skip 'You attempted to run Heroku on behalf of root user. Please, create a new user and restart script' error
}

# calling all functions in order
environment # check environment and install debian (proot-distro)
check       # check and install packages
install     # download Heroku
start       # starting Heroku Userbot
