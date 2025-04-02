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


class TokyoNightMoon(Style):
    name = 'tokyonight_moon'

    background_color = "#222436"
    highlight_color = "#2d3f76"
    line_number_color = "#3b4261"
    line_number_background_color = "#222436"

    styles = {
        Comment.Hashbang: '#89ddff',
        Comment.Preproc: '#86e1fc',
        Comment.PreprocFile: '#c3e88d',
        Comment.Special: '#65bcff',
        Comment: 'italic #636da6',
        Generic.Deleted: '#e26a75',
        Generic.Emph: 'italic',
        Generic.EmphStrong: 'italic bold',
        Generic.Error: '#c53b53',
        Generic.Heading: 'bold #82aaff',
        Generic.Inserted: '#b8db87',
        Generic.Output: '#828bb8',
        Generic.Prompt: '#65bcff',
        Generic.Strong: 'bold',
        Generic.Subheading: '#65bcff',
        Generic.Traceback: '#c53b53',
        Keyword.Constant: '#ff966c',
        Keyword.Declaration: '#c099ff',
        Keyword.Namespace: '#86e1fc',
        Keyword.Pseudo: '#c099ff',
        Keyword.Type: '#65bcff',
        Keyword: 'italic #fca7ea',
        Literal: '#ff966c',
        Name.Attribute: '#4fd6be',
        Name.Builtin: '#65bcff',
        Name.BuiltinPseudo: '#ff757f',
        Name.Class: '#65bcff',
        Name.Constant: '#ff966c',
        Name.Decorator: '#65bcff',
        Name.Entity: '#65bcff',
        Name.Exception: '#c099ff',
        Name.Function.Magic: '#89ddff',
        Name.Function: '#82aaff',
        Name.Label: '#82aaff',
        Name.Namespace: '#82aaff',
        Name.Property: '#4fd6be',
        Name.Tag: '#ff757f',
        Name.Variable.Class: '#4fd6be',
        Name.Variable.Global: '#ff757f',
        Name.Variable.Instance: '#4fd6be',
        Name.Variable.Magic: '#ff757f',
        Name.Variable: '#c8d3f5',
        Number: '#ff966c',
        Operator: '#89ddff',
        Punctuation.Marker: '#89ddff',
        Punctuation: '#828bb8',
        String.Affix: '#fca7ea',
        String.Delimiter: '#89ddff',
        String.Doc: '#ffc777',
        String.Escape: '#c099ff',
        String.Interpol: '#65bcff',
        String.Regex: '#b4f9f8',
        String.Symbol: '#ff966c',
        String: '#c3e88d',
        Token: '#c8d3f5',
    }
