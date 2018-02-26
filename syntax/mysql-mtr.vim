" Vim syntax file
" Language:     mtr + mysql
" Maintainer:   Joao Gramacho
" URL:          https://github.com/jgramacho/vim-mysql-mtr
" Filenames:    *.test *.inc

" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" Comments
syn keyword mtrTodo contained TODO FIXME XXX NOTE
syn match mtrComment "#.*$" contains=mtrTodo

" Delimiters
syn match mtrDelimiter "[();,\{\}]"
syn match mtrDelimiter "\-\-"

" Includes
syn match mtrInclude "include/.*\.inc" contains=@NoSpell
syn match mtrInclude "extra/.*\.inc" contains=@NoSpell
syn match mtrInclude "extra/.*\.test" contains=@NoSpell
syn match mtrInclude "suite/.*\.inc" contains=@NoSpell
syn match mtrInclude "suite/.*\.test" contains=@NoSpell
syn match mtrInclude "../inc/.*\.inc" contains=@NoSpell

" Keywords
syn keyword mtrKeyword append_file
syn keyword mtrKeyword cat_file change_user character_set chmod connect connection let copy_file
syn keyword mtrKeyword disable_abort_on_error enable_abort_on_error disable_connect_log enable_connect_log disable_info enable_info disable_metadata enable_metadata
syn keyword mtrKeyword disable_parsing enable_parsing disable_ps_protocol enable_ps_protocol disable_query_log enable_query_log disable_reconnect enable_reconnect
syn keyword mtrKeyword disable_result_log enable_result_log disable_rpl_parse enable_rpl_parse disable_session_track_info enable_session_track_info disable_warnings enable_warnings
syn keyword mtrKeyword dec delimiter die diff_files dirty_close disconnect
syn keyword mtrKeyword echo end end_timer eval exec execw exit
syn keyword mtrKeyword file_exists
syn keyword mtrKeyword horizontal_results
syn keyword mtrKeyword if inc
syn keyword mtrKeyword let
syn keyword mtrKeyword mkdir
syn keyword mtrKeyword list_files list_files_append_file list_files_write_file lowercase_result
syn keyword mtrKeyword move_file
syn keyword mtrKeyword output
syn keyword mtrKeyword perl ping
syn keyword mtrKeyword query query_get_value query_horizontal query_vertical
syn keyword mtrKeyword real_sleep reap remove_file remove_files_wildcard replace_column replace_regex replace_result require reset_connection result result_format rmdir
syn keyword mtrKeyword save_master_pos send send_eval send_quit send_shutdown shutdown_server skip sleep sorted_result
syn keyword mtrKeyword start_timer sync_slave_with_master sync_with_master system
syn keyword mtrKeyword vertical_results
syn keyword mtrKeyword wait_for_slave_to_stop while write_file
syn keyword mtrSource  source
syn keyword mtrError   error

" Functions
syn keyword mtrFunction convert_error

" Strings (single- and double-quote)
syn region mtrString   start=+"+ skip=+\\\\\|\\"+ end=+"+
syn region mtrString   start=+'+ skip=+\\\\\|\\'+ end=+'+
syn region mtrSQLQuery start=+`+ skip=+\\\\\|\\'+ end=+`+

" Numbers and hexadecimal values
syn match mtrNumber "-\=\<[0-9]*\>"
syn match mtrNumber "-\=\<[0-9]*\.[0-9]*\>"
syn match mtrNumber "-\=\<[0-9][0-9]*e[+-]\=[0-9]*\>"
syn match mtrNumber "-\=\<[0-9]*\.[0-9]*e[+-]\=[0-9]*\>"
syn match mtrNumber "\<0x[abcdefABCDEF0-9]*\>"

" User variables
syn match mtrVariable "\$\a*[A-Za-z0-9]*\([._]*[A-Za-z0-9]\)*"

" Highlight links
if version >= 508 || !exists("did_mysql_mtr_syn_inits")
  if version < 508
    let did_mysql_mtr_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink mtrDelimiter Delimiter
  HiLink mtrSource    Include
  HiLink mtrInclude   Include
  HiLink mtrKeyword   Statement
  HiLink mtrError     Error
  HiLink mtrFunction  Function
  HiLink mtrVariable  Identifier
  HiLink mtrComment   Comment
  HiLink mtrTodo      Todo
  HiLink mtrString    String
  HiLink mtrSQLQuery  String
  HiLink mtrNumber    Number

  delcommand HiLink
endif

let b:current_syntax = "mysql-mtr"

