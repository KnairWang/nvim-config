local lsp_status = require('lsp-status')
local colors = require('galaxyline.theme').default
local gl = require('galaxyline')

gl.section.left = {{
    Whitespace = {
        provider = function()
            return "   "
        end,
        highlight = {colors.fg, colors.darkblue}
    }
}, {
    FileIcon = {
        provider = 'FileIcon',
        highlight = {colors.fg, colors.darkblue}
    }
}, {
    FileName = {
        provider = 'FileName',
        highlight = {colors.fg, colors.darkblue}
    }
}, {
    GitBranch = {
        provider = 'GitBranch',
        icon = '    ',
        separator = '  ',
        highlight = {colors.blue}
    }
}, {
    LSP = {
        provider = function()
            return lsp_status.status()
        end,
        highlight = {colors.orange, colors.darkblue}
    }
}}
gl.section.right = {{
    LineColumn = {
        provider = 'LineColumn',
        separator = ' ',
        icon = ''
    }
}, {
    LineColumn_LineNumber = {
        provider = function()
        end,
        separator = ' '
    }
}, {
    Encode = {
        provider = 'FileEncode',
        separator = ' ',
        icon = '',
        highlight = {colors.cyan, colors.purple}
    }
}, {
    FileType = {
        provider = 'FileTypeName',
        separator = ' ',
        icon = ' ',
        highlight = {colors.green, colors.purple}
    }
}, {
    WhitespaceR = {
        provider = function()
            return "   "
        end,
        separator = ' ',
        highlight = {colors.fg, colors.darkblue}
    }
}}
