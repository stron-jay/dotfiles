let mapleader=" "

" -- INSERT --
inoremap jj <Esc>
inoremap \nn <C-o>o
inoremap JJ <C-x><C-l>
" == AUTO-COMPLETE ==
" Parens
inoremap ( ()<Left>
inoremap (<CR> (<CR>)<Esc>O<Tab>
inoremap <expr> ) strpart(getline('.'), col('.') - 1, 1) == ")" ? "\<Right>" : ")"
" Brackets
inoremap [ []<Left>
inoremap [<CR> [<CR>]<Esc>O<Tab>
inoremap [;<CR> [<CR>];<Esc>O<Tab>
inoremap <expr> ] strpart(getline('.'), col('.') - 1, 1) == "]" ? "\<Right>" : "]"
" Squirrely Braces
inoremap { {}<Left>
inoremap {<CR> {<CR>}<Esc>O
inoremap {;<CR> {<CR>};<Esc>O
inoremap <expr> } strpart(getline('.'), col('.') - 1, 1) == "}" ? "\<Right>" : "}"
" Quotes
inoremap <expr> ' strpart(getline('.'), col('.') - 1, 1) == "\'" ? "\<Right>" : "\'\'\<Left>"
inoremap <expr> " strpart(getline('.'), col('.') - 1, 1) == "\"" ? "\<Right>" : "\"\"\<Left>"
inoremap <BS> <C-r>=Remove_pairs()<CR>

let g:AllPairs = {'(':')', '[':']', '{':'}', "'":"'", '"':'"', "`":"`" }

function! Remove_pairs()
  let [before, after] = s:getline()
  for open in keys(g:AllPairs)
    let close = g:AllPairs[open]
    let b = matchstr(before, '\V'.open.'\v\s?$')
    let a = matchstr(after, '^\v\s*\V'.close)
    if b != '' && a != ''
      return "\<BS>\<DELETE>"
      " return s:backspace(b).s:delete(a)
    end
  endfor
  return "\<BS>"
endfunction

function! s:getline()
  let line = getline('.')
  let pos = col('.') - 1
  let before = strpart(line, 0, pos)
  let after = strpart(line, pos)
  return [before, after]
endfunction

" -- NORMAL --
nnoremap j gj
nnoremap k gk
nnoremap <Leader>o o<Esc>
nnoremap <Leader>O O<Esc>
nnoremap U <C-r>
nnoremap <Leader>v <C-v>
" nnoremap <Tab> :bn<CR>
" nnoremap <S-tab> :bp<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>/ :noh<CR>
nnoremap <Leader><CR> :7sp<CR>:term<CR>i
" -- VISUAL --
" vnoremap <Leader>p "_dP Supposedly the best thing ever?
vnoremap " "ndi""<Left><C-o>"nP<Right><C-c>
vnoremap ' "ndi''<Left><C-o>"nP<Right><C-c>
vnoremap ` "ndi``<Left><C-o>"nP<Right><C-c>
vnoremap ( "ndi()<Left><C-o>"nP<Right><C-c>
vnoremap [ "ndi[]<Left><C-o>"nP<Right><C-c>
vnoremap { "ndi{}<Left><C-o>"nP<Right><C-c>
" Sorting
vnoremap <Leader>s :'<,'>!sort -f<CR>
" -- TERMINAL --
tnoremap \<CR> <C-\><C-n>
tnoremap \2 <C-\><C-n>:res2<CR>:wincmd k<CR>
tnoremap \c <C-c>
" -- GLOBAL --
"  Yank & Pull
vnoremap <Leader>y "+y
vnoremap <Leader>p "+p
nnoremap <Leader>Y gg"+yG
nnoremap <Leader>"p "+p
" Make what you will
nnoremap <Leader>m :let &makeprg=""<Left>
nnoremap <Leader>c :cclose<CR>:silent !clear<CR>:make<CR>
" -- WINDOWS --
nnoremap <Leader>h :wincmd h<CR>
nnoremap <Leader>j :wincmd j<CR>
nnoremap <Leader>k :wincmd k<CR>
nnoremap <Leader>l :wincmd l<CR>
nnoremap <Leader>\ :vsp<CR>
" -- PLUGINS --
" FZF
nnoremap <Leader>p :Files<CR>
" remove all trailing whitespaces
nnoremap <silent> <Leader>rs :let _s=@/ <Bar> :%s/\s\+$//e
      \ <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

