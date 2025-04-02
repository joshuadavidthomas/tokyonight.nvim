from pygments.style import Style
from pygments.token import Comment
from pygments.token import Generic
from pygments.token import Keyword
from pygments.token import Literal
from pygments.token import Name
from pygments.token import Number
from pygments.token import Operator
from pygments.token import Punctuation
from pygments.token import String
from pygments.token import Token


class TokyoNightStorm(Style):
    name = 'tokyonight_storm'

    background_color = "#24283b"
    highlight_color = "#2e3c64"
    line_number_color = "#3b4261"
    line_number_background_color = "#24283b"

    styles = {
        Comment.Hashbang: '#89ddff',
        Comment.Preproc: '#7dcfff',
        Comment.PreprocFile: '#9ece6a',
        Comment.Special: '#2ac3de',
        Comment: 'italic #565f89',
        Generic.Deleted: '#914c54',
        Generic.Emph: 'italic',
        Generic.EmphStrong: 'italic bold',
        Generic.Error: '#db4b4b',
        Generic.Heading: 'bold #7aa2f7',
        Generic.Inserted: '#449dab',
        Generic.Output: '#a9b1d6',
        Generic.Prompt: '#2ac3de',
        Generic.Strong: 'bold',
        Generic.Subheading: '#2ac3de',
        Generic.Traceback: '#db4b4b',
        Keyword.Constant: '#ff9e64',
        Keyword.Declaration: '#bb9af7',
        Keyword.Namespace: '#7dcfff',
        Keyword.Pseudo: '#bb9af7',
        Keyword.Type: '#2ac3de',
        Keyword: 'italic #9d7cd8',
        Literal: '#ff9e64',
        Name.Attribute: '#73daca',
        Name.Builtin: '#2ac3de',
        Name.BuiltinPseudo: '#f7768e',
        Name.Class: '#2ac3de',
        Name.Constant: '#ff9e64',
        Name.Decorator: '#2ac3de',
        Name.Entity: '#2ac3de',
        Name.Exception: '#bb9af7',
        Name.Function.Magic: '#89ddff',
        Name.Function: '#7aa2f7',
        Name.Label: '#7aa2f7',
        Name.Namespace: '#7aa2f7',
        Name.Property: '#73daca',
        Name.Tag: '#f7768e',
        Name.Variable.Class: '#73daca',
        Name.Variable.Global: '#f7768e',
        Name.Variable.Instance: '#73daca',
        Name.Variable.Magic: '#f7768e',
        Name.Variable: '#c0caf5',
        Number: '#ff9e64',
        Operator: '#89ddff',
        Punctuation.Marker: '#89ddff',
        Punctuation: '#a9b1d6',
        String.Affix: '#9d7cd8',
        String.Delimiter: '#89ddff',
        String.Doc: '#e0af68',
        String.Escape: '#bb9af7',
        String.Interpol: '#2ac3de',
        String.Regex: '#b4f9f8',
        String.Symbol: '#ff9e64',
        String: '#9ece6a',
        Token: '#c0caf5',
    }
