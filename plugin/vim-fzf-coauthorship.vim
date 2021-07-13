function! AttributeCoauthorship(nameAndEmail)
  let attribution = "Co-authored-by: " . a:nameAndEmail
  silent put =attribution
endfunction

function! Coauthorship()
  call fzf#run({
    \ 'source': 'git log --pretty="%an <%ae>" | sort | uniq',
    \ 'sink': function('AttributeCoauthorship'),
    \ 'options': "-i --preview 'git log -1 --author {} --pretty=\"authored %h %ar:%n%n%B\"'"
    \ })
endfunction

command! Coauthorship call Coauthorship()
