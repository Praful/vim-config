This repository contains my Vim config files. I keep them on GitHub so that I can 
download them onto whichever computer I'm using.

I've made the repository public so that others can look at the files. There's nothing special about them. I put them here for those few people who like to browse other people's Vim config files in the hope that they may learn something. I learnt more about Vim by looking at vimrc files of those with greater experience.

Do not use these files as they are! They're customised for my requirements and yours will be different. The files will just make Vim confusing for you, especially if you're learning! 

# vimrc

My `vimrc` file has evolved over many years and could do with being tidied up! For me, it's good enough.

If you're a newcomer to Vim, a vimrc to start with is Tim Pope's [sensible vimrc file](https://github.com/tpope/vim-sensible). For advice on structuring your Vim config files, see:
1. https://github.com/romainl/idiomatic-vimrc 
2. https://vimways.org/2018/from-vimrc-to-vim

If you want to know the meaning of a setting, press K whilst the cursor is on the word. That will open Vim help for that word.

# plugins.vim

The `plugins.vim` file contains the plugins I use. Again, don't use this file! However, it may give you some ideas about plugins to explore if your needs are not met by Vim alone.

If I had the time, I'd probably remove some of these plugins because I know Vim better now. However, for me, there is little downside including the plugins. I did a quick test loading a 600MB text file with and without plugins and there no was difference on Windows 10 if GVim was running. If GVim wasn't running, the times were 6s vs 9s. But since I always have GVim running, it makes no discernable difference to me - and I rarely edit 600MB files!

If you're starting Vim, I'd suggest you don't use any plugins. Exploring, installing and configuring Vim plugins is a rabbit hole that will eat into your time and distract you from your goal, which is, presumably, editing text!

If you're a developer (especially editing JavaScript/HTML/CSS) and don't want to use a full-blown IDE, consider using Visual Studio Code with the Vim plugin. There are development features that you could spend considerable time configuring in Vim that ship with VS Code. If you do need to use plugins in VS Code, it's generally a better experience than Vim, especially since plugins are part of VS Code's design. With Vim, plugins are generally fine but I get the impression that they were more of an afterthought rather than an integral part of Vim's design.

# configure-plugins.vim

After `vimrc` and `plugins.vim` are run, the actual plugins are loaded. Once loaded, `configure-plugins.vim` is run. This file contains options and mappings that relate to the plugins referenced in `plugins.vim`.

Again, there is very little reason to use this file!
