" MySQL Test Run (mtr) - MySQL testing files
au BufNewFile,BufRead */mysql-test/*.test	setf mysql-mtr
au BufNewFile,BufRead */mysql-test/*.inc	setf mysql-mtr
