function isAnsible(path, bufnr)
    if vim.fs.find({ 'tasks', 'roles', 'handlers', 'group_vars', 'host_vars' },
        { type = 'directory', upward = true }) and
        vim.fs.find({ 'ansible.cfg', '.ansible.lint' }, { upward = true }) then
        return 'yaml.ansible'
    else
        return 'yaml'
    end
end

vim.filetype.add({
    extension = {
        yml = isAnsible,
        yaml = isAnsible,
    },
})
