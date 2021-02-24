# Basic Config
A basic emacs config with some sensible defaults and support for R.
Some useful resources for learning emacs:

# Key Rebinds
For ease of use I've rebound the default copy cut and paste keys to C-c, C-x, C-v
like in most programs. I've also rebound C-q to evaluate a region of code near 
the cursor/code that's selected in R mode.

## Useful Resources
https://www.gnu.org/software/emacs/manual/html_node/emacs/index.html
http://ergoemacs.org/index.html
https://www.emacswiki.org/

## A note on rebinding Caps lock
install setxkbmap and make sure the following is run at start:
setxkbmap -option ctrl:nocaps  

For manjaro kde specifically, launch Autostart and add it as a script.
