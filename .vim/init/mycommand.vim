"ぶっちゃけ<Leader>を使った方がいい
"ただし、<Leader>で類似したマッピングが多いと遅くなるので登録しすぎには注意

command! MD set filetype=markdown

command! -nargs=0 Hello call Hello()
function! Hello()
  echo "Hello!!"
endfunction
