function! s:TemplateFrom(files)
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

inoremap <F5>h <C-R>=<SID>TemplateFrom(["$HOME/mygits/dotfiles/.vim/init/hugoDict.txt"])<CR><C-P>
nnoremap <F5>h i<C-R>=<SID>TemplateFrom(["$HOME/mygits/dotfiles/.vim/init/hugoDict.txt"])<CR><C-P>
inoremap <F5>t <C-R>=<SID>TemplateFrom(["$HOME/mygits/dotfiles/.vim/init/hugoThumbnailDict.txt"])<CR><C-P>
nnoremap <F5>t i<C-R>=<SID>TemplateFrom(["$HOME/mygits/dotfiles/.vim/init/hugoThumbnailDict.txt"])<CR><C-P>
