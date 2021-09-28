# In Terminal Stock Ticker #

> Real-time stock tickers from the command-line.

[`ticker.sh`](./ticker.sh) is a simple shell script using the Yahoo Finance API as a data source. It features colored output and is able to display pre- and post-market prices.

![ticker.sh](https://raw.githubusercontent.com/pstadler/ticker.sh/master/screenshot.png)

----
----
## Install ##

```sh
$ curl -o ticker.sh https://raw.githubusercontent.com/pstadler/ticker.sh/master/ticker.sh
```

> In-order to run [`ticker.sh`](./ticker.sh), you must first install [jq](https://stedolan.github.io/jq/), a versatile command-line JSON processor.   `jq-osx-amd64` was tested and shown to work on this system.

----
----
## Usage ##

Calling [`00_runticker.sh`](./00_runticker.sh), to execute the ticker for specified symbols.

----

```sh
# Single symbol:
$ ./ticker.sh AAPL

# Multiple symbols:
$ ./ticker.sh AAPL MSFT GOOG BTC-USD

# Read from file:
$ echo "AAPL MSFT GOOG BTC-USD" > ~/.ticker.conf
$ ./ticker.sh $(cat ~/.ticker.conf)

# Use different colors:
$ COLOR_BOLD="\e[38;5;248m" \
  COLOR_GREEN="\e[38;5;154m" \
  COLOR_RED="\e[38;5;202m" \
  ./ticker.sh AAPL

# Disable colors:
$ NO_COLOR=1 ./ticker.sh AAPL

# Update every five seconds:
$ watch -n 5 -t -c ./ticker.sh AAPL MSFT GOOG BTC-USD
# Or if `watch` is not available:
$ while true; do clear; ./ticker.sh AAPL MSFT GOOG BTC-USD; sleep 5; done
```

This script works well with [GeekTool](https://www.tynsoe.org/v2/geektool/) and similar software:

```sh
PATH=/usr/local/bin:$PATH # make sure to include the path where jq is located
~/GitHub/ticker.sh/ticker.sh AAPL MSFT GOOG BTC-USD
```
