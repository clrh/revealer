package Reveal;
use XML::Tag::html5;
use Modern::Perl;
use Exporter 'import';
use utf8;
use open qw< :std :utf8 >;
our @EXPORT = qw< reveal S FOL FP FUL >;

# ABSTRACT: create reveal.js presentations using easy keywords

my ($begin, $end) = do {
    local $/;
    split "XXXX", <DATA>;
};

sub reveal (&) {
    my $slides = shift;
    $begin, $slides->(), $end;
}

sub S (&) {
    my ( $title, @content ) = (shift)->();
    section { h2{ $title }, @content }
}

sub FOL {
    my @f = @_;
    ol { map { li{+{qw< class fragment >}, $_} } @f }
}
sub FUL {
    my @f = @_;
    ul { map { li{+{qw< class fragment >}, $_} } @f }
}
sub FP { map { p{+{qw< class fragment >}, $_} } @_ }

1;
__DATA__
<html lang="en"><head><meta charset="utf-8"><title>reveal.js</title>
<meta name="description" content="An easy to use CSS 3D slideshow tool for quickly creating good looking HTML presentations.">
		<meta name="author" content="Hakim El Hattab">
		<meta name="apple-mobile-web-app-capable" content="yes" />
		<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
		<link href='http://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
		<link rel="stylesheet" href="css/reset.css">
		<link rel="stylesheet" href="css/main.css">
		<link rel="stylesheet" href="css/print.css" type="text/css" media="print">
		<link rel="stylesheet" href="lib/zenburn.css">
	</head>

	<body style="margin-top: 10px">
        <div id="reveal">
			<!-- Used to fade in a background when a specific slide state is reached -->
			<div class="state-background"></div>
			
			<!-- Any section element inside of this container is displayed as a slide -->
			<div class="slides">
                        XXXX </div> </div>
        <script src="js/reveal.js"></script>
		<!-- Optional libraries for code syntax highlighting and classList support in IE9 -->
		<script src="lib/highlight.js"></script>
		<script src="lib/classList.js"></script>
		
		<script>
			// Parse the query string into a key/value object
			var query = {};
			location.search.replace( /[A-Z0-9]+?=(\w*)/gi, function(a) {
				query[ a.split( '=' ).shift() ] = a.split( '=' ).pop();
			} );

			// Fires when a slide with data-state=customevent is activated
			Reveal.addEventListener( 'customevent', function() {
				alert( '"customevent" has fired' );
			} );

			// Fires each time a new slide is activated
			Reveal.addEventListener( 'slidechanged', function( event ) {
				// event.indexh & event.indexv
			} );

			Reveal.initialize({
				// Display controls in the bottom right corner
				controls: true,

				// Display a presentation progress bar
				progress: true,

				// If true; each slide will be pushed to the browser history
				history: true,

				// Loops the presentation, defaults to false
				loop: false,

				// Flags if mouse wheel navigation should be enabled
				mouseWheel: true,

				// Apply a 3D roll to links on hover
				rollingLinks: true,

				// UI style
				theme: query.theme || 'default', // default/neon

				// Transition style
				transition: query.transition || 'default' // default/cube/page/concave/linear(2d)
			});

			hljs.initHighlightingOnLoad();
		</script>
	</body> </html>
