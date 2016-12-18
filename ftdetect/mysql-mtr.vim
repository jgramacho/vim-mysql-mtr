" MySQL Test Run (mtr) - MySQL Test Framework source files
au BufNewFile,BufRead */mysql-test/*.test	set filetype=mysql-mtr
au BufNewFile,BufRead */mysql-test/*.inc	set filetype=mysql-mtr
au BufNewFile,BufRead */rapid/*/mtr/*.test	set filetype=mysql-mtr
au BufNewFile,BufRead */rapid/*/mtr/*.inc	set filetype=mysql-mtr
