This repository contains my Vim config files. I keep them on GitHub so that I can download them onto whichever computer I'm using.

I've made the repository public so that others can look at the files. There's nothing special about them. I put them here for those few people who like to browse other people's Vim config files in the hope that they may learn something. I learnt more about Vim by looking at vimrc files of those with greater experience.

Do not use these files as they are! They're customised for my requirements and yours will be different. The files will just make Vim confusing for you, especially if you're learning! 

# vimrc

My `vimrc` file has evolved over many years and could do with being tidied up! For me, it's good enough.

If you're a newcomer to Vim, a vimrc to start with is Tim Pope's [sensible vimrc file](https://github.com/tpope/vim-sensible). For advice on structuring your Vim config files, see:
1. https://github.com/romainl/idiomatic-vimrc 
2. https://vimways.org/2018/from-vimrc-to-vim

If you want to know the meaning of a setting, press K whilst the cursor is on the word. That will open Vim help for that word.

Some of the more possibly interesting mappings are:

- Since, by default, `h` and `l` move left and right, I've remapped `H` and `L` to move to the beginning and end of line. This means that `H` doesn't go to the top of the screen. I've added `T` to go to the top, which mirrors `zt` (moves current line and cursor to the top). On a similar note, since I've remapped `L` (by default, it goes to the bottom of the screen),  I've remapped `B` to go to the bottom (to mirror `zb`). Of course, that means I can't use `B`'s original mapping (go back a WORD) but that's not a mapping I used.
- Continuing the theme of left and right, I've mapped `CTRL-H` and `CTRL-L` to go to the previous/next buffer. I used to use tabs in Vim because of tabs in other editors and IDEs. But buffers are better because tabs don't behave the way they do in other programs, for example, you can end up with the same file in two tabs! The path of least resistance is to use buffers!
- Since `k` and `j` go up and down, I've mapped `CTRL-K` and `CTRL-J` to move the current line up or down two lines
- `\\` seems a good way to cancel search highlights (= `:noh`).
- `gy` seems an obvious mapping to yank the entire butter (although `:%y` is always available).
- By default, `CTRL-O` and `CTRL-I` let you jump backwards and forwards in the jump list. I've mapped `ALT-O` and `ALT-I` to let you jump backwards and forwards in the changelist.
- Since I'm increasingly using VS Code for current projects, I have a mapping to open the current Vim file in VS Code. Similarly, I have a mapping to open the current VS Code file in Vim, in case I need to do some text manipulation not supported by the Vim emulation plugin I use in VS Code.

# plugins.vim

The `plugins.vim` file contains the plugins I use. Again, don't use this file! However, it may give you some ideas about plugins to explore if your needs are not met by Vim alone.

If I had the time, I'd probably remove some of these plugins because I know Vim better now. However, for me, there is little downside including the plugins. I did a quick test loading a 600MB text file with and without plugins and there was little difference on Windows 10 if GVim was running. I always have GVim running but I rarely edit 600MB files!

If you're starting to learn Vim, I'd suggest you don't use any plugins. Exploring, installing and configuring Vim plugins is a rabbit hole that will eat into your time and distract you from your goal, which is, presumably, editing text! Focus on learning Vim commands. You may find my [cheatsheet](https://github.com/Praful/vim-cheatsheet) a useful memory aid.

If you're tempted to install a plugin, search Vim's help or the web. If I knew what I know now, I'd use more functions from [vimrcfu](https://vimrcfu.com) and elsewhere before resorting to functions. That said, don't shy away from plugins. Picking the right one can save you a lot of time.

On modern computers (mine are four years old as I write this), Vim is fast even with the 54 plugins I have (some are loaded on demand). My desktop is an i7 (Skylake) with 32GB RAM and my laptop has an i7 (mobile Skylake) and 16GB RAM. I doubled the RAM of both two years ago given how inexpensive it is is and the benefit it gives. This makes Windows 10 fast. If you're using Linux or macOS, another spec may be optimal. My ten-year old Linux laptop has only 5GB and is too slow for my liking. That said the CPU is ancient!

If you're a developer (especially editing JavaScript/HTML/CSS) and don't want to use a full-blown IDE, consider using Visual Studio Code with the Vim plugin. There are development features that you could spend considerable time configuring in Vim that ship with VS Code. If you do need to use plugins in VS Code, it's generally a better experience than Vim, especially since plugins are part of VS Code's design. With Vim, plugins are generally fine but I get the impression that they were more of an afterthought rather than an integral part of Vim's design. On my PCs, VS Code loads in less than a second and is generally fast.

# configure-plugins.vim

After `vimrc` and `plugins.vim` are run, the actual plugins are loaded. Once loaded, `configure-plugins.vim` is run. This file contains options and mappings that relate to the plugins referenced in `plugins.vim`.

Again, there is very little reason to use this file!
