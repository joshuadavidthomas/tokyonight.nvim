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


class TokyoNightDay(Style):
    name = 'tokyonight_day'

    background_color = "#e1e2e7"
    highlight_color = "#b7c1e3"
    line_number_color = "#a8aecb"
    line_number_background_color = "#e1e2e7"

    styles = {
        Comment.Hashbang: '#006a83',
        Comment.Preproc: '#007197',
        Comment.PreprocFile: '#587539',
        Comment.Special: '#188092',
        Comment: 'italic #848cb5',
        Generic.Deleted: '#c47981',
        Generic.Emph: 'italic',
        Generic.EmphStrong: 'italic bold',
        Generic.Error: '#c64343',
        Generic.Heading: 'bold #2e7de9',
        Generic.Inserted: '#4197a4',
        Generic.Output: '#6172b0',
        Generic.Prompt: '#188092',
        Generic.Strong: 'bold',
        Generic.Subheading: '#188092',
        Generic.Traceback: '#c64343',
        Keyword.Constant: '#b15c00',
        Keyword.Declaration: '#9854f1',
        Keyword.Namespace: '#007197',
        Keyword.Pseudo: '#9854f1',
        Keyword.Type: '#188092',
        Keyword: 'italic #7847bd',
        Literal: '#b15c00',
        Name.Attribute: '#387068',
        Name.Builtin: '#188092',
        Name.BuiltinPseudo: '#f52a65',
        Name.Class: '#188092',
        Name.Constant: '#b15c00',
        Name.Decorator: '#188092',
        Name.Entity: '#188092',
        Name.Exception: '#9854f1',
        Name.Function.Magic: '#006a83',
        Name.Function: '#2e7de9',
        Name.Label: '#2e7de9',
        Name.Namespace: '#2e7de9',
        Name.Property: '#387068',
        Name.Tag: '#f52a65',
        Name.Variable.Class: '#387068',
        Name.Variable.Global: '#f52a65',
        Name.Variable.Instance: '#387068',
        Name.Variable.Magic: '#f52a65',
        Name.Variable: '#3760bf',
        Number: '#b15c00',
        Operator: '#006a83',
        Punctuation.Marker: '#006a83',
        Punctuation: '#6172b0',
        String.Affix: '#7847bd',
        String.Delimiter: '#006a83',
        String.Doc: '#8c6c3e',
        String.Escape: '#9854f1',
        String.Interpol: '#188092',
        String.Regex: '#2e5857',
        String.Symbol: '#b15c00',
        String: '#587539',
        Token: '#3760bf',
    }
