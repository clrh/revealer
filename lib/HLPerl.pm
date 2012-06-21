package HLPerl;
use Modern::Perl;
use Exporter 'import';
our @EXPORT = qw< perl dotpl >;;

sub perl {
    use Syntax::Highlight::Engine::Kate;
    use File::Slurp qw< read_file >;
    state $hl = Syntax::Highlight::Engine::Kate->new
    ( language => 'Perl'
    , substitutions =>
        { "<" => "&lt;"
        , ">" => "&gt;"
        , "&" => "&amp;"
        , " " => "&nbsp;"
        , "\t" => "&nbsp;&nbsp;&nbsp;"
        , "\n" => "<BR>\n"
        }
    , format_table =>
        { Alert => ["<font color=\"#0000ff\">", "</font>"]
        , BaseN => ["<font color=\"#007f00\">", "</font>"]
        , BString => ["<font color=\"#c9a7ff\">", "</font>"]
        , Char => ["<font color=\"#ff00ff\">", "</font>"]
        , Comment => ["<font color=\"#7f7f7f\"><i>", "</i></font>"]
        , DataType => ["<font color=\"#0000ff\">", "</font>"]
        , DecVal => ["<font color=\"#00007f\">", "</font>"]
        , Error => ["<font color=\"#ff0000\"><b><i>", "</i></b></font>"]
        , Float => ["<font color=\"#007f7f\">", "</font>"]
        , Function => ["<font color=\"#007f00\">", "</font>"]
        , IString => ["<font color=\"#ff0000\">", ""]
        , Keyword => ["<b>", "</b>"]
        , Normal => ["", ""]
        , Operator => ["<font color=\"#ffa500\">", "</font>"]
        , Others => ["<font color=\"#b03060\">", "</font>"]
        , RegionMarker => ["<font color=\"#96b9ff\"><i>", "</i></font>"]
        , Reserved => ["<font color=\"#9b30ff\"><b>", "</b></font>"]
        , String => ["<font color=\"#ff0000\">", "</font>"]
        , Variable => ["<font color=\"#0000ff\"><b>", "</b></font>"]
        , Warning => ["<font color=\"#0000ff\"><b><i>", "</b></i></font>"]
        }
    );
    q{<pre><code style="font-size: 20px; margin-top: 10px; background-color: black; border: solid 1px white;">}
    , $hl->highlightText( shift )
    , "</code></pre>"
}

sub dotpl { perl ''.read_file shift }

1;
