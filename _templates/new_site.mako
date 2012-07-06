<!DOCTYPE html>

<!-- paulirish.com/2008/conditional-/static/css-vs-css-hacks-answer-neither/ -->
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="no-js lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="no-js lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="en"> <!--<![endif]-->
<head>
	<meta charset="utf-8" />

	<!-- Set the viewport width to device width for mobile -->
	<meta name="viewport" content="width=device-width" />

	<title>From Python Import Podcast</title>

    <link rel="alternate" type="application/rss+xml" title="from python import podcast RSS Feed" href="http://www.frompythonimportpodcast.com/feed">
    <link rel="alternate" type="application/atom+xml" title="from python import podcast Atom Feed" href="http://www.frompythonimportpodcast.com/feed/atom">

	<!-- Included CSS Files -->
	<link rel="stylesheet" href="/static/css/foundation.css">
	<link rel="stylesheet" href="/static/css/app.css">

    <link href="http://fonts.googleapis.com/css?family=Cabin:700|Oswald:300" rel="stylesheet" type="text/css">

	<!--[if lt IE 9]>
		<link rel="stylesheet" href="/static/css/ie.css">
	<![endif]-->
	
	<script src="/static/js/modernizr.foundation.js"></script>

	<!-- IE Fix for HTML5 Tags -->
	<!--[if lt IE 9]>
		<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

</head>
<body>

<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/all.js#xfbml=1";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>

    <!-- header nav -->
    <nav id="site-header">
        <div id="nav-bar-slim" class="container">
            <a class="nav-bar-toggle">Show Nav</a>
            <a class="nav-bar-toggle" style="display:none">Hide Nav</a>
        </div>
        <div id="nav-bar-fat" class="container">
            <div class="row">
                    <ul class="nav-bar">
                        <li><a href="/">Home</a></li>
                        <li><a href="#">About</a></li>
                        <li><a href="#">Shows</a></li>
                        <li><a href="#">Blog</a></li>
                        <li><a href="#">Goodies</a></li>
                        <li><a href="#">Contact</a></li>
                        <li id="search">
                    <form action="http://www.google.com/search" method="get">
                        <input type="search" name="q" placeholder="Search">
                        <input type="hidden" name="sitesearch" value="http://frompythonimportpodcast.com">
                    </form>
                    </li>

                    </ul>
                </div>
            </div>
        </div>
    </nav>


	<!-- masthead -->
    <header id="masthead">
        <div class="container">
            
            <!-- TODO: consider a single masthead image, for adaptiveness -->
            <div class="row">
                <div class="twelve columns">
                    <img src="/static/images/fpip/masthead.jpg">
                </div>
                <!--
                <div class="three columns">
                    <img src="/static/images/fpip/arrow.jpg">
                </div>
                <div class="three columns">
                    <img src="/static/images/fpip/python.jpg">
                </div>
                <div class="three columns">
                    <img src="/static/images/fpip/podcast.jpg">
                </div>
                <div class="three columns">
                    <img src="/static/images/fpip/balloon.jpg">
                </div>
                -->
            </div>

            <div class="row">
                <div class="twelve columns">
                    <hgroup>
                        <h1>From Python Import Podcast</h1>
                        <h2>an irregular podcast for irreverent pythonistas</h2>
                    </hgroup>
                    <div class="panel">
                    <p>Easy-going, conversational, often silly, and occasionally
                    earning our iTunes "explicit" tag, From Python Import Podcast is
                    <strong>news, analysis, discussion, and general
                        shenanigans about the Python
                        language and community</strong>.
                    Put on your headphones and come hang out with us!</p>
                </div>
                </div>
            </div>

        </div>
    </header>


    <!-- listen -->
    <section id="listen">
        <div class="container">
            <div class="row">
                <div class="twelve columns">
                    <h3>Listen</h3>
                </div>
            </div>
            <div class="row">
                <div class="seven columns">
                    <article>
                        <h4><a href="#">Episode XYZ: Awesome Episode Title</a></h4>
                        <p>Published MM/DD/YYYY
                            | <img src="/static/images/misc/explicit.png" alt="May contain explicit content"></p>
                        <p>Nisi pariatur banksy locavore lo-fi. Tattooed
                        flexitarian sartorial stumptown ex vero. Echo park
                        pariatur duis synth, fixie street art sint vero
                        mcsweeney's banksy deserunt high life wes anderson
                        exercitation. Godard blog wayfarers excepteur
                        exercitation et, tattooed occupy eu american apparel
                        flexitarian. Odio excepteur delectus eu, carles
                        consectetur direct trade...</p>
                        <nav>
                            <p>
                                <a href="#">Show Notes</a> |
                                <a href="#">Download MP3</a> |
                                <a href="#">Download OGG</a>
                            </p>
                        </nav>
                        <p><audio controls preload="metadata">
                            <source type="audio/mpeg" src="http://frompythonimportpodcast.com/shows/FPIP010.mp3" />
                            <source type="audio/ogg" src="http://frompythonimportpodcast.com/shows/FPIP010.ogg" />
                        </audio></p>
                        <ul class="social-links">
                            <li><a href="https://twitter.com/share"
                                class="twitter-share-button"
                                data-url="http://example.com">Tweet</a></li>
                            <li><div class="g-plusone" data-size="medium"
                                data-href="http://example.com"></div></li>
                            <li><div class="fb-like"
                                data-href="http://example.com"
                                data-send="false" data-layout="button_count"
                                data-width="100" data-show-faces="false"
                                style="vertical-align:top;"></div></li>
                            <li><a
                                href="http://pinterest.com/pin/create/button/?url=http%3A%2F%2Fexample.com"
                                class="pin-it-button"
                                count-layout="horizontal"><img border="0"
                                src="//assets.pinterest.com/images/PinExt.png"
                                title="Pin It" /></a></li>
                        </ul>

                    </article>

                    <div class="row">
                        <div class="five columns">
                            <h5>Previous Episodes</h5>
                            <ul>
                                <li><a href="#">Episode XYZ - 1</a></li>
                                <li><a href="#">Episode XYZ - 2</a></li>
                                <li><a href="#">Episode XYZ - 3</a></li>
                            </ul>
                        </div>
                        <div class="five columns">
                            <h5>Top Episodes</h5>
                            <ul>
                                <li><a href="#">Episode ABC</a></li>
                                <li><a href="#">Episode DEF</a></li>
                                <li><a href="#">Episode GHI</a></li>
                            </ul>
                        </div>
                    </div>
                    <p><a href="#">More Episodes</a></p>

                </div>
                <div class="four columns offset-by-one">
                    <h4>Subscribe</h4>
                    <p>Make sure you never miss an episode!</p>
                    <ul>
                        <li><a
                            href="http://itunes.apple.com/us/podcast/from-python-import-podcast/id525611633"
                            rel="alternate" type="application/rss+xml"
                            class="nice white large radius full-width button">Subscribe in iTunes</a></li>
                        <li><a
                            href="http://feeds.feedburner.com/FromPythonImportPodcastmp3"
                            rel="alternate" type="application/rss+xml"
                            class="nice white large radius full-width button">Subscribe to MP3s</a></li>
                        <li><a
                            href="http://feeds.feedburner.com/FromPythonImportPodcastogg"
                            rel="alternate" type="application/rss+xml"
                            class="nice white large radius full-width button">Subscribe to OGGs</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </section>

    <!-- read  -->
    <section id="read">
        <div class="container">
            <div class="row">
                <div class="twelve columns">
                    <h3>Read</h3>
                </div>
            </div>

            <div class="row">
                <div class="seven columns">
                    <article>
                        <h4><a href="#">Blog Post Title</a></h4>
                        <p>Published MM/DD/YYYY</p>
                        <p>Williamsburg anim pickled, tattooed echo park raw
                        denim excepteur ex pork belly chillwave minim photo
                        booth assumenda mcsweeney's do. Fanny pack labore
                        pour-over ennui gastropub ut. Pitchfork etsy proident
                        nihil, food truck occaecat placeat sartorial gentrify
                        trust fund ut magna reprehenderit aute. Do magna
                        tattooed post-ironic, freegan pork belly organic forage
                        +1 mustache mlkshk keytar pickled you probably haven't
                        heard of them. Umami chillwave bushwick, high life
                        consequat ennui commodo. Sartorial Austin aute
                        sustainable keytar. Dolore ex sed locavore, est terry
                        richardson gastropub hella retro cred mumblecore
                        lo-fi.</p>

                        <p>Portland consectetur photo booth, minim yr stumptown
                        williamsburg reprehenderit. Carles nostrud 3 wolf moon,
                        nulla cupidatat you probably haven't heard of them yr
                        non. Jean shorts whatever food truck incididunt +1.
                        Terry richardson mlkshk cray, american apparel sartorial
                        you probably haven't heard of them pariatur. Wolf
                        ullamco gastropub, semiotics +1 narwhal cray. Skateboard
                        occupy stumptown letterpress trust fund squid, retro
                        cupidatat narwhal PBR assumenda. Raw denim ethical
                        veniam scenester minim skateboard.</p>

                        <ul class="social-links">
                            <li><a href="https://twitter.com/share"
                                class="twitter-share-button"
                                data-url="http://example.com">Tweet</a></li>
                            <li><div class="g-plusone" data-size="medium"
                                data-href="http://example.com"></div></li>
                            <li><div class="fb-like"
                                data-href="http://example.com"
                                data-send="false" data-layout="button_count"
                                data-width="100" data-show-faces="false"
                                style="vertical-align:top;"></div></li>
                            <li><a
                                href="http://pinterest.com/pin/create/button/?url=http%3A%2F%2Fexample.com"
                                class="pin-it-button"
                                count-layout="horizontal"><img border="0"
                                src="//assets.pinterest.com/images/PinExt.png"
                                title="Pin It" /></a></li>
                        </ul>

                    </article>

                    <div class="row">
                        <div class="five columns">
                            <h5>Previous Posts</h5>
                            <ul>
                                <li><a href="#">Post - 1</a></li>
                                <li><a href="#">Post - 2</a></li>
                                <li><a href="#">Post - 3</a></li>
                            </ul>
                        </div>
                        <div class="five columns">
                            <h5>Featured Posts</h5>
                            <ul>
                                <li><a href="#">Post - X</a></li>
                                <li><a href="#">Post - Y</a></li>
                                <li><a href="#">Post - Z</a></li>
                            </ul>
                        </div>
                    </div>
                    <p><a href="#">More Posts</a></p>
                </div>

                <div class="four columns offset-by-one">
                    <h4>Twitter</h4>
                    <p>A little bird told me...</p>
                    <div id="twitter-widget"></div>
                </div>
            </div>
        </div>
    </section>

    <!-- footer -->
    <footer id="site-footer">
        <div class="container">
            <div class="row">

                <div class="two columns">
                    <h6>Navigate</h6>
                    <ul>
                        <li><a href="#">Home</a></li>
                        <li><a href="#">About</a></li>
                        <li><a href="#">Shows</a></li>
                        <li><a href="#">Blog</a></li>
                        <li><a href="#">Goodies</a></li>
                        <li><a href="#">Back to Top</a></li>
                    </ul>
                </div>

                <div class="two columns">
                    <h6>Socialize</h6>
                    <ul>
                        <li><a href="https://twitter.com/share"
                            class="twitter-share-button" data-lang="en"
                            data-url="http://frompythonimportpodcast.com"
                            data-via="__fpip__"
                            data-related="codeshaman,mpirnat,dstanek,mcrute,benjaminws">Tweet</a></li>
                        <li><div class="fb-like"
                            data-href="http://frompythonimportpodcast.com"
                            data-send="false" data-layout="button_count"
                            data-width="225" data-show-faces="false"
                            data-colorscheme="light"></div>
                        <li><div class="g-plusone" data-size="medium" data-href="http://frompythonimportpodcast.com"></div></li>
                        <li><a href="http://pinterest.com/pin/create/button/?url=http%3A%2F%2Ffrompythonimportpodcast.com" class="pin-it-button" count-layout="horizontal"><img border="0" src="//assets.pinterest.com/images/PinExt.png" title="Pin It" /></a></li>
                    </ul>
                </div>

                <div class="four columns">
                    <h6>Subscribe</h6>
                    <ul>
                        <li><img src="/static/images/misc/RSS-icon-tiny.gif">
                            <a href="http://feeds.feedburner.com/FromPythonImportPodcast">Full feed</a> - all posts and episodes</li>
                        <li><img src="/static/images/misc/RSS-icon-tiny.gif">
                            <a href="http://feeds.feedburner.com/FromPythonImportPodcastmp3">MP3s</a> - only episodes, MP3 enclosures</li>
                        <li><img src="/static/images/misc/RSS-icon-tiny.gif">
                            <a href="http://feeds.feedburner.com/FromPythonImportPodcastogg">OGGs</a> - only episodes, OGG enclosures</li>
                        <li><img src="/static/images/misc/itunes-tiny.png">
                            <a href="http://itunes.apple.com/us/podcast/from-python-import-podcast/id525611633">iTunes</a> - find us in the iTunes store</li>
                        <li><img src="http://twitter.com/images/three_circles/twitter-bird-16x16.png" width="12" height="12">
                            <a href="http://twitter.com/__fpip__">Twitter</a> -
                            follow us, say hi!</li>
                    </ul>
                </div>

                <div class="four columns">
                    <h6>Contact</h6>
                    <form class="nice" action="#" method="POST">
                        <input type="text" name="name" class="input-text expand" placeholder="Name">
                        <input type="email" name="email" class="input-text expand" placeholder="Email Address">
                        <textarea name="message" rows="3" class="expand" placeholder="Your Message"></textarea>
                        <input type="submit" value="Send" class="nice small black radius button">
                    </form>
                </div>


            </div>

            <div id="copyright" class="row">
                <div class="two columns">
                    <a rel="license"
                    href="http://creativecommons.org/licenses/by-nc-nd/3.0/"><img
                    alt="Creative Commons License" style="border-width:0"
                    src="http://i.creativecommons.org/l/by-nc-nd/3.0/88x31.png"
                    /></a>
                </div>

                <div class="six columns">
                    <p>Copyright &copy; 2010-2012 From Python Import Podcast;
                    licensed under a
                    <a rel="license"
                    href="http://creativecommons.org/licenses/by-nc-nd/3.0/">Creative
                    Commons Attribution-NonCommercial-NoDerivs 3.0 Unported
                    License</a>.</p>

                </div>

                <div class="four columns">
                    <p>Powered by
                        <a href="http://www.blogofile.com">Blogofile</a> and
                        <a href="http://foundation.zurb.com/">Foundation</a>
                    </p>
                </div>
            </div>

        </div>
    </footer>





	<!-- Included JS Files -->
	<script src="/static/js/jquery.min.js"></script>
    <script src="/static/js/jquery.placeholder.min.js?v=2.0.7"></script>
	<script src="/static/js/foundation.js"></script>
	<script src="/static/js/app.js"></script>

    <!-- TODO: Google analytics -->
<script charset="utf-8" src="http://widgets.twimg.com/j/2/widget.js"></script>
<script type="text/javascript" src="//assets.pinterest.com/js/pinit.js"></script>
<script>

// Input placeholders for IE
$(function() {
    $('input, textarea').placeholder();
});

// Twitter widget
new TWTR.Widget({
  id: 'twitter-widget',
  version: 2,
  type: 'profile',
  interval: 30000,
  title: '',
  subject: '',
  width: 'auto',
  height: 300,
  theme: {
    shell: {
      background: 'black',
      color: '#ffffff'
    },
    tweets: {
      background: '#ffffff',
      color: '#444444',
      links: '#3773a5'
    }
  },
  features: {
    scrollbar: false,
    loop: true,
    live: true,
    behavior: 'all'
  }
}).render().setUser('__fpip__').start();

!function(d,s,id){var
    js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");

// Google +1
(function() {
    var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
    po.src = 'https://apis.google.com/js/plusone.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
})();

$(document).ready(function() {
    if(!pageYOffset) window.scrollTo(1,0);

    $(window).bind('resize', function() {
        if($(document).width() >= 767) {
            var nav_bar = $('#nav-bar-fat')[0]
            var show_link = $('a.nav-bar-toggle')[0];
            var hide_link = $('a.nav-bar-toggle')[1];
            if(hide_link.style.display != "none") {
                hide_link.style.display = "none";
                show_link.style.display = "";
            }
            $('#nav-bar-fat').css({display: ""});
        }
    });

    $('a.nav-bar-toggle').click(function() {
        $('#nav-bar-fat').slideToggle(100);
        $('a.nav-bar-toggle').toggle();
        return false;
    });
});
</script>

</body>
</html>
