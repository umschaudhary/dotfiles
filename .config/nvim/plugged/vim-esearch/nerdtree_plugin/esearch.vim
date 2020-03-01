let s:esearch = get(g:, 'esearch', {})

if get(s:esearch, 'nerdtree_plugin', 1)
  let s:default_mappings = get(s:esearch, 'default_mappings', g:esearch#defaults#default_mappings)

  for s:mapping in esearch#_mappings()
    if !s:default_mappings && s:mapping.default | continue | endif

    if s:mapping.rhs ==# '<Plug>(esearch)'
      call NERDTreeAddKeyMap({
            \ 'key': s:mapping.lhs,
            \ 'override': 1,
            \ 'callback': 'NERDTreeEsearchDir',
            \ 'quickhelpText': 'Search in dir',
            \ 'scope': 'Node' })
    endif
  endfor

  fu! NERDTreeEsearchDir(node) abort
    let path = a:node.path
    let cwd = path.isDirectory ? path.str() : path.getParent().str()
    return esearch#init({ 'cwd': cwd })
  endfu
end
