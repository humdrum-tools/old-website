from pygments.lexer import RegexLexer
from pygments.token import Token, Comment, Keyword, Literal, Whitespace, Punctuation


class KernLexer(RegexLexer):
    name = 'Kern Lexer'
    aliases = ['kern']
    filenames = ['*.krn', '*.kern']
    mimetypes = ['application/kern']

    tokens = {
        'root': [
            (r'\t', Token.KernTab),
            (r'^!!![a-zA-Z@#0-9]+:.*', Token.KernTitle),
            (r'^!.*', Token.KernGlobalComment),
            (r'\*[^\t]*', Token.KernExclusive),
            (r'\*\*[^\t]*', Token.KernInterpretation),
            (r'=[0-9]*[:!|]*\t?', Token.KernBar),
            (r'[0-9.]+[a-grA-G#n-]+', Token.KernNotes),
            (r'\.', Token.KernDot),
        ]
    }
