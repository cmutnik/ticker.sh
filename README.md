# In Terminal Stock Ticker #

> Real-time stock tickers from the command-line.

[`ticker.sh`](./scripts/ticker.sh) is a simple shell script using the Yahoo Finance API as a data source. It features colored output and is able to display pre- and post-market prices.

![ticker.sh](https://raw.githubusercontent.com/pstadler/ticker.sh/master/screenshot.png)

```
.
├── scripts
│   ├── 00_run_ticker.sh
│   ├── 01_run_ticker_using_input_files.sh
│   └── ticker.sh
└── stored_parameter_files
    ├── set_stock_symbols.txt
    └── set_timer_interval.txt
```
The [`scripts/`](./scripts) directory stores all shell scripts needed to execute this ticker.

The [`stored_parameter_files/`](./stored_parameter_files) directory stores contains `*.txt` files that can be used to store default values.

----
----
## Install ##

```sh
$ curl -o ticker.sh https://raw.githubusercontent.com/pstadler/ticker.sh/master/ticker.sh
```

> In-order to run [`ticker.sh`](./scripts/ticker.sh), you must first install [jq](https://stedolan.github.io/jq/), a versatile command-line JSON processor.  On this system, `jq-osx-amd64` was tested and shown to work.

----
----
## Usage ##

----
### Using Scripts ###

> Calling [`00_run_ticker.sh`](./scripts/00_run_ticker.sh), will execute the ticker for symbols designated inside the script.  This has the lowest barrier of entry:
```sh
./scripts/00_run_ticker.sh
```

> Calling [`01_run_ticker_using_input_files.sh`](./scripts/01_run_ticker_using_input_files.sh) allows symbols and refresh intervals to be stored in external files and passed in as command line args.
```sh
# Using the parameters stored in txt files
./scripts/01_run_ticker_using_input_files.sh

# Using command-line inputs
./scripts/01_run_ticker_using_input_files.sh interval=10 symbols=AAPL
```

----
### General Methodology ###

```sh
# Single symbol:
$ ./scripts/ticker.sh AAPL

# Multiple symbols:
$ ./scripts/ticker.sh AAPL MSFT GOOG BTC-USD

# Read from file:
$ echo "AAPL MSFT GOOG BTC-USD" > ~/.ticker.conf
$ ./scripts/ticker.sh $(cat ~/.ticker.conf)

# Use different colors:
$ COLOR_BOLD="\e[38;5;248m" \
  COLOR_GREEN="\e[38;5;154m" \
  COLOR_RED="\e[38;5;202m" \
  ./scripts/ticker.sh AAPL

# Disable colors:
$ NO_COLOR=1 ./scripts/ticker.sh AAPL

# Update every five seconds:
$ watch -n 5 -t -c ./scripts/ticker.sh AAPL MSFT GOOG BTC-USD
# Or if `watch` is not available:
$ while true; do clear; ./scripts/ticker.sh AAPL MSFT GOOG BTC-USD; sleep 5; done
```

This script works well with [GeekTool](https://www.tynsoe.org/v2/geektool/) and similar software:

```sh
PATH=/usr/local/bin:$PATH # make sure to include the path where jq is located
~/GitHub/ticker.sh/ticker.sh AAPL MSFT GOOG BTC-USD
```
