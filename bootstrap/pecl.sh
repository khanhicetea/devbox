#!/bin/bash
# Run PHP Pecl with custom version

PHP_VERSION=8.3
PHP_BIN="/opt/homebrew/opt/php@$PHP_VERSION/bin/php"
PHP_INCLUDE_PATH="/opt/homebrew/opt/php@$PHP_VERSION/share/php@$PHP_VERSION/pear"
$PHP_BIN -C -q -d include_path=$PHP_INCLUDE_PATH -d date.timezone=UTC -d output_buffering=1 -d variables_order=EGPCS -d safe_mode=0 -d register_argc_argv="On" $PHP_INCLUDE_PATH/peclcmd.php "$@"
