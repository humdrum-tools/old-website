from pygments.style import Style
from pygments.token import Token


class KernStyle(Style):
    default_style = ''

    background_color = '#222'
    highlight_color = '#e6e1dc'

    styles = {
        Token.KernGlobalComment: '#BABABA',
        Token.KernTitle: 'bold #333300',
        Token.KernExclusive: 'bold #0033CC',
        Token.KernInterpretation: '#0099CC',
        Token.KernBar: 'bg:#FFFF00 bold #993300',
        Token.KernNotes: '#FF6600',
        Token.KernDot: '#006600',
        Token.KernExpressions: '',
    }
