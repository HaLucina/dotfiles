function! s:CompleteFrom(files)
  let pos = col('.') - 1
  let line = getline('.')
  let start = pos
  while start > 0 && line[start - 1] !~ '[ \t]'
    let start -= 1
  endwhile
  let word = strpart(line, start, pos - start)
  let lines = []
  for f in a:files
    let inputfile = expand(f)
    for line in readfile(inputfile)
      if line =~ '^'.word
        call add(lines, line)
      endif
    endfor
  endfor
  call complete(start + 1, lines)
  return ''
endfunction

inoremap <F5> <C-R>=<SID>CompleteFrom(["$HOME/mygits/dotfiles/.vim/init/hugodict.txt"])<CR><C-P>
nnoremap <F5> i<C-R>=<SID>CompleteFrom(["$HOME/mygits/dotfiles/.vim/init/hugodict.txt"])<CR><C-P>

