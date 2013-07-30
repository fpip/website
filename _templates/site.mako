<%def name="filter(chain)">
    ${bf.filter.run_chain(chain, capture(caller.body))}
</%def>
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
    <title><%block name="title"/></title>

    <link rel="alternate" type="application/rss+xml" title="${bf.config.blog.name} RSS Feed" href="http://www.frompythonimportpodcast.com/feed">
    <link rel="alternate" type="application/atom+xml" title="${bf.config.blog.name} Atom Feed" href="http://www.frompythonimportpodcast.com/feed/atom">

	<!-- Included CSS Files -->
	<link rel="stylesheet" href="/static/css/foundation.css">
	<link rel="stylesheet" href="/static/css/app.css">

    <link href="http://fonts.googleapis.com/css?family=Cabin:700|Oswald:300" rel="stylesheet" type="text/css">

	<!--[if lt IE 9]>
		<link rel="stylesheet" href="/static/css/ie.css">
	<![endif]-->

    <link rel="apple-touch-icon" href="/static/images/fpip/4-up-square-57.png" />
    <link rel="apple-touch-icon" sizes="72x72" href="/static/images/fpip/4-up-square-72.png" />
    <link rel="apple-touch-icon" sizes="114x114" href="/static/images/fpip/4-up-square-114.png" />
	
	<script src="/static/js/modernizr.foundation.js"></script>

	<!-- IE Fix for HTML5 Tags -->
	<!--[if lt IE 9]>
		<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->
</head>
<body>

% if bf.config.blog.facebook.enabled:
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/all.js#xfbml=1";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
% endif

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
                        <li><a href="/about">About</a></li>
                        <li><a href="/episodes">Episodes</a></li>
                        <li><a href="/blog">Blog</a></li>
                        <!--<li><a href="/goodies">Goodies</a></li>-->
                        <li><a href="#contact">Contact</a></li>
                        <li id="search">
                    <form action="http://www.google.com/search" method="get">
                        <input type="search" name="q" placeholder="Search">
                        <input type="hidden" name="sitesearch" value="${bf.config.site.url}">
                    </form>
                    </li>

                    </ul>
                </div>
            </div>
        </div>
    </nav>

    <%block name="header"/>

    ${next.body()}
    
    <%block name="footer">

    <!-- footer -->
    <footer id="site-footer">
        <div class="container">
            <div class="row">

                <div class="two columns">
                    <h6>Navigate</h6>
                    <ul>
                        <li><a href="/">Home</a></li>
                        <li><a href="/about">About</a></li>
                        <li><a href="/episodes">Episodes</a></li>
                        <li><a href="/blog">Blog</a></li>
                        <!--<li><a href="/goodies">Goodies</a></li>-->
                        <li><a href="#">Back to Top</a></li>
                    </ul>
                </div>

                <div class="two columns">
                    <h6>Socialize</h6>
                    <ul>
                        % if bf.config.blog.twitter.enabled:
                        <li><a href="https://twitter.com/share"
                            class="twitter-share-button" data-lang="en"
                            data-url="${bf.config.site.url}"
                            data-via="${bf.config.blog.twitter.user}"
                            data-related="${bf.config.blog.twitter.related}">Tweet</a></li>
                        % endif
                        % if bf.config.blog.facebook.enabled:
                        <li><div class="fb-like"
                            data-href="${bf.config.site.url}"
                            data-send="false" data-layout="button_count"
                            data-width="225" data-show-faces="false"
                            data-colorscheme="light"></div></li>
                        % endif
                        % if bf.config.blog.googleplus.enabled:
                        <li><div class="g-plusone"
                            data-size="medium"
                            data-href="${bf.config.site.url}"></div></li>
                        % endif
                        % if bf.config.blog.pinterest.enabled:
                        <li><a href="http://pinterest.com/pin/create/button/?url=${bf.config.site.url|u}" class="pin-it-button" count-layout="horizontal"><img border="0" src="//assets.pinterest.com/images/PinExt.png" title="Pin It" /></a></li>
                        % endif
                    </ul>
                </div>

                <div class="four columns">
                    <h6>Subscribe</h6>
                    <ul>
                        % if bf.config.blog.podcast.full_feed:
                        <li><img src="/static/images/misc/RSS-icon-tiny.gif">
                            <a href="${bf.config.blog.podcast.full_feed}">Full feed</a> - all posts and episodes</li>
                        % endif
                        % if bf.config.blog.podcast.mp3_feed:
                        <li><img src="/static/images/misc/RSS-icon-tiny.gif">
                            <a href="${bf.config.blog.podcast.mp3_feed}">MP3s</a> - only episodes, MP3 enclosures</li>
                        % endif
                        % if bf.config.blog.podcast.ogg_feed:
                        <li><img src="/static/images/misc/RSS-icon-tiny.gif">
                            <a href="${bf.config.blog.podcast.ogg_feed}">OGGs</a> - only episodes, OGG enclosures</li>
                        % endif
                        % if bf.config.blog.podcast.itunes_link:
                        <li><img src="/static/images/misc/itunes-tiny.png">
                            <a href="${bf.config.blog.podcast.itunes_link}">iTunes</a> - find us in the iTunes store</li>
                        % endif
                        % if bf.config.blog.twitter.user:
                        <li><img src="http://twitter.com/images/resources/twitter-bird-16x16.png" width="12" height="12">
                            <a href="http://twitter.com/${bf.config.blog.twitter.user|u}">Twitter</a> -
                            follow us, say hi!</li>
                        % endif
                    </ul>
                </div>

                <div class="four columns">
                    <a name="contact"></a>
                    <h6>Contact</h6>
                    <form id="contact" class="nice" action="/contact-handler/" method="POST">
                        <input type="text" name="name" class="input-text expand" placeholder="Name">
                        <input type="email" name="email" class="input-text expand" placeholder="Email Address">
                        <textarea name="message" rows="3" class="expand" placeholder="Your Message"></textarea>
                        <input type="submit" value="Send" name="Send" class="nice small black radius button">
                        <input type="hidden" name="mailer.form-key" value="fpip-contact">
                        <input type="hidden" name="mailer.fields.ignore" value="Send">
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

% if bf.config.blog.pinterest.enabled:
<script type="text/javascript" src="//assets.pinterest.com/js/pinit.js"></script>
% endif
<script>

// Input placeholders for IE
$(function() {
    $('input, textarea').placeholder();
});

% if bf.config.blog.twitter.enabled:
// twitter buttons
!function(d,s,id){var
    js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");
% endif

% if bf.config.blog.googleplus.enabled:
// Google +1
(function() {
    var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
    po.src = 'https://apis.google.com/js/plusone.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
})();
% endif

$(document).ready(function() {
    // hide address bar in iOS
    if(!pageYOffset) window.scrollTo(1,0);

    // special page resize handling
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

        if($(document).width() >= 547) {
            $("#pagehead img").attr('src', '/static/images/fpip/4-up-square-50.jpg');
        } else {
            $("#pagehead img").attr('src', '/static/images/fpip/4-up-square-100.jpg');
        }
    });

    // nav bar toggle handler
    $('a.nav-bar-toggle').click(function() {
        $('#nav-bar-fat').slideToggle(100);
        $('a.nav-bar-toggle').toggle();
        return false;
    });

    // contact form handler
    $("#contact").submit(function(event) {
        event.preventDefault();
            
        var $form = $(this);
        var url = $form.attr('action');
        var jqxhr = $.post(url, $form.serialize())
            .success(function(data) {
                $("#contact")[0].reset();
                alert("Got it, thanks!");
                console.info(data);
            })
            .error(function(data) { alert("Woops, something broke; yell at @mcrute, okay?"); console.error(data); })
            .complete(function() { });
    });
});

// Google Analytics
var _gaq = _gaq || [];
_gaq.push(['_setAccount', 'UA-15534287-1']);
_gaq.push(['_trackPageview']);

(function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
})();

</script>

    </%block>

</body>
</html>
