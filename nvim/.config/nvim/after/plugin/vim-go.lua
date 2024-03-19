vim.cmd[[
    let g:go_metalinter_command= 'golangci-lint'
    let g:go_metalinter_autosave = 0
    " let g:go_metalinter_enabled = ['revive', 'vet', 'errcheck']
    " let g:go_metalinter_enabled = ['all']
    " let g:go_metalinter_autosave_enabled = [ 'vet','errcheck']
    let g:go_diagnostics_enabled = 1
    let g:go_diagnostics_level = 1
]]

