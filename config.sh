DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PATH=$(find $DIR -type d | grep -v ".git" | tr '\n' ':')$PATH

# function set_dir() {

# }