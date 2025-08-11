sudo apt install asciinema
cargo install --git https://github.com/asciinema/agg
asciinema rec demo.cast --append
asciinema play demo.cast
agg --theme monokai --font-size 20 --speed 2 demo.cast demo.gif
