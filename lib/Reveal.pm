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
<!doctype html>  
<html lang="en">
	
	<head>
		<meta charset="utf-8">
		
		<title>%%TITLE%%</title>

		<meta name="description" content="%%DESC%%">
		<meta name="author" content="%%AUTHOR%%">

		<meta name="apple-mobile-web-app-capable" content="yes" />
		<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
		
		<link href='http://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
		
		<link rel="stylesheet" href="css/main.css">
		<link rel="stylesheet" href="css/theme/default.css">

		<!-- For syntax highlighting -->
		<link rel="stylesheet" href="lib/css/zenburn.css">

		<script>
			// If the query includes 'print-pdf' we'll use the PDF print sheet
			document.write( '<link rel="stylesheet" href="css/print/' + ( window.location.search.match( /print-pdf/gi ) ? 'pdf' : 'paper' ) + '.css" type="text/css" media="print">' );
		</script>

		<!--[if lt IE 9]>
		<script src="lib/js/html5shiv.js"></script>
		<![endif]-->
	</head>
	
	<body>
		
		<div class="reveal">

			<!-- Used to fade in a background when a specific slide state is reached -->
			<div class="state-background"></div>
			
			<!-- Any section element inside of this container is displayed as a slide -->
			<div class="slides">
                        XXXX 
			</div>

			<!-- The navigational controls UI -->
			<aside class="controls">
				<a class="left" href="#">&#x25C4;</a>
				<a class="right" href="#">&#x25BA;</a>
				<a class="up" href="#">&#x25B2;</a>
				<a class="down" href="#">&#x25BC;</a>
			</aside>

			<!-- Presentation progress bar -->
			<div class="progress"><span></span></div>
			
		</div>

		<script src="lib/js/head.min.js"></script>
		<script src="js/reveal.min.js"></script>

		<script>
			
			// Full list of configuration options available here:
			// https://github.com/hakimel/reveal.js#configuration
			Reveal.initialize({
				controls: true,
				progress: true,
				history: true,
				
				transition: Reveal.getQueryHash().transition || 'default', // default/cube/page/concave/linear(2d)

				// Optional libraries used to extend on reveal.js
				dependencies: [
					{ src: 'lib/js/highlight.js', async: true, callback: function() { window.hljs.initHighlightingOnLoad(); } },
					{ src: 'lib/js/classList.js', condition: function() { return !document.body.classList; } },
					{ src: 'lib/js/showdown.js', condition: function() { return !!document.querySelector( '[data-markdown]' ); } },
					{ src: 'lib/js/data-markdown.js', condition: function() { return !!document.querySelector( '[data-markdown]' ); } },
					{ src: 'socket.io/socket.io.js', async: true, condition: function() { return window.location.host === 'localhost:1947'; } },
					{ src: 'plugin/speakernotes/client.js', async: true, condition: function() { return window.location.host === 'localhost:1947'; } },
				]
			});
			
		</script>

	</body>
</html>

