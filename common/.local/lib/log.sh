# Constants -----------------------------------------------------------

LIB_LOG_GREEN='\033[0;32m'
LIB_LOG_RED='\033[0;31m'
LIB_LOG_YELLOW='\033[1;33m'
LIB_LOG_RESET='\033[0m'

# Helpers -------------------------------------------------------------

# 全てのログを標準エラー(>&2)に出力することで、関数の戻り値を汚さない
lib_log_info() {
  printf "${LIB_LOG_YELLOW}[System]${LIB_LOG_RESET} %s\n" "$1" >&2
}

lib_log_success() {
  printf "${LIB_LOG_GREEN}[Success]${LIB_LOG_RESET} %s\n" "$1" >&2
}

lib_log_error() {
  printf "${LIB_LOG_RED}[Error]${LIB_LOG_RESET} %s\n" "$1" >&2
}
