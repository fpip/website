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

    <title>${bf.config.blog.name}</title>

    <link rel="alternate" type="application/rss+xml" title="${bf.config.blog.name} RSS Feed" href="http://www.frompythonimportpodcast.com/feed">
    <link rel="alternate" type="application/atom+xml" title="${bf.config.blog.name} Atom Feed" href="http://www.frompythonimportpodcast.com/feed/atom">

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
                        <input type="hidden" name="sitesearch" value="${bf.config.site.url}">
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
            
            <div class="row">
                <div class="twelve columns">
                    <img src="/static/images/fpip/masthead.jpg">
                </div>
            </div>

            <div class="row">
                <div class="twelve columns">
                    <hgroup>
                        <h1>${bf.config.blog.name}</h1>
                        <h2>${bf.config.blog.description}</h2>
                    </hgroup>
                    <div class="panel">
                        <p>Easy-going, conversational, often silly, and
                            occasionally earning our iTunes "explicit" tag,
                            From Python Import Podcast is
                            <strong>news, analysis, discussion, and general
                                shenanigans about the Python language
                                and community</strong>.
                    Put on your headphones and come hang out with us!</p>
                    </div>
                </div>
            </div>

        </div>
    </header>


    <!-- listen -->
    % if latest_show:
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
                    <h4><a href="${latest_show.permapath()}">${latest_show.title}</a></h4>
                        <p>Published ${latest_show.date.strftime("%B %d, %Y")}
                            % if bf.config.blog.podcast.explicit == "yes":
                                | <img src="/static/images/misc/explicit.png" alt="May contain explicit content">
                            %endif
                            </p>
                            ${latest_show.content}
                        <nav>
                            <p>
                                <a href="${latest_show.permapath()}">Show Notes</a>
                                % if latest_show.mp3_file:
                                    | <a href="${bf.config.site.url}/${latest_show.mp3_file}">Download MP3</a>
                                % endif
                                % if latest_show.ogg_file:
                                    | <a href="${bf.config.site.url}/${latest_show.ogg_file}">Download OGG</a>
                                % endif
                            </p>
                        </nav>
                        <p><audio controls preload="metadata">
                        % if latest_show.mp3_file:
                            <source type="audio/mpeg" src="${bf.config.site.url}/${latest_show.mp3_file}" />
                        % endif
                        % if latest_show.ogg_file:
                            <source type="audio/ogg" src="${bf.config.site.url}/${latest_show.ogg_file}" />
                        % endif
                        </audio></p>
                        <ul class="social-links">
                            % if bf.config.blog.twitter.enabled:
                            <li><a href="https://twitter.com/share"
                                class="twitter-share-button"
                                data-url="${latest_show.permalink}">Tweet</a></li>
                            % endif
                            % if bf.config.blog.googleplus.enabled:
                            <li><div class="g-plusone" data-size="medium"
                                data-href="${latest_show.permalink}"></div></li>
                            % endif
                            % if bf.config.blog.facebook.enabled:
                            <li><div class="fb-like"
                                data-href="${latest_show.permalink}"
                                data-send="false" data-layout="button_count"
                                data-width="100" data-show-faces="false"
                                style="vertical-align:top;"></div></li>
                            % endif
                            % if bf.config.blog.pinterest.enabled:
                            <li><a
                                href="http://pinterest.com/pin/create/button/?url=${latest_show.permalink|u}"
                                class="pin-it-button"
                                count-layout="horizontal"><img border="0"
                                src="//assets.pinterest.com/images/PinExt.png"
                                title="Pin It" /></a></li>
                            % endif
                        </ul>

                    </article>

                    % if recent_shows or top_shows:
                    <div class="row">

                        % if recent_shows:
                        <div class="five columns">
                            <h5>Previous Episodes</h5>
                            <ul>
                                % for post in recent_shows:
                                <li><a href="${post.permalink}">${post.title}</a></li>
                                % endfor
                            </ul>
                            <p><a href="#">More Episodes</a></p>
                        </div>
                        % endif

                        % if top_shows:
                        <div class="five columns">
                            <h5>Top Episodes</h5>
                            <ul>
                                % for post in top_shows:
                                <li><a href="${post.permalink}">${post.title}</a></li>
                                % endfor
                            </ul>
                        </div>
                        % endif
                    </div>
                    % endif

                </div>
                <div class="four columns offset-by-one">
                    <h4>Subscribe</h4>
                    <p>Make sure you never miss an episode!</p>
                    <ul>
                        % if bf.config.blog.podcast.itunes_link:
                        <li><a
                            href="${bf.config.blog.podcast.itunes_link}"
                            rel="alternate" type="application/rss+xml"
                            class="nice white large radius full-width button">Subscribe in iTunes</a></li>
                        % endif
                        % if bf.config.blog.podcast.mp3_feed:
                        <li><a
                            href="${bf.config.blog.podcast.mp3_feed}"
                            rel="alternate" type="application/rss+xml"
                            class="nice white large radius full-width button">Subscribe to MP3s</a></li>
                        % endif
                        % if bf.config.blog.podcast.ogg_feed:
                        <li><a
                            href="${bf.config.blog.podcast.ogg_feed}"
                            rel="alternate" type="application/rss+xml"
                            class="nice white large radius full-width button">Subscribe to OGGs</a></li>
                        % endif
                    </ul>
                </div>
            </div>
        </div>
    </section>
    % endif

    <!-- read  -->
    % if latest_post:
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
                        <h4><a href="#">${latest_post.title}</a></h4>
                        <p>Published ${latest_post.date.strftime("%B %d, %Y")}</p>
                        ${latest_post.content}

                        <ul class="social-links">
                            % if bf.config.twitter.enabled:
                            <li><a href="https://twitter.com/share"
                                class="twitter-share-button"
                                data-url="${latest_post.permalink}">Tweet</a></li>
                            % endif
                            % if bf.config.googleplus.enabled:
                            <li><div class="g-plusone" data-size="medium"
                                data-href="${latest_post.permalink}"></div></li>
                            % endif
                            % if bf.config.facebook.enabled:
                            <li><div class="fb-like"
                                data-href="${latest_post.permalink}"
                                data-send="false" data-layout="button_count"
                                data-width="100" data-show-faces="false"
                                style="vertical-align:top;"></div></li>
                            % endif
                            % if bf.config.pinterest.enabled:
                            <li><a
                                href="http://pinterest.com/pin/create/button/?url=${latest_post.permalink|u}"
                                class="pin-it-button"
                                count-layout="horizontal"><img border="0"
                                src="//assets.pinterest.com/images/PinExt.png"
                                title="Pin It" /></a></li>
                            % endif
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
                    <p><a href="#">More posts</a></p>
                </div>

                % if bf.config.blog.twitter.widget:
                <div class="four columns offset-by-one">
                    <h4>Twitter</h4>
                    <p>A little bird told me...</p>
                    <div id="twitter-widget"></div>
                </div>
                % endif
            </div>
        </div>
    </section>
    % endif

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
                            <a href="${bf.config.blog.podcast.full_feed">Full feed</a> - all posts and episodes</li>
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
                            <a href="${bf.config.blog.podcast.itunes_link">iTunes</a> - find us in the iTunes store</li>
                        % endif
                        % if bf.config.blog.twitter.user:
                        <li><img src="http://twitter.com/images/three_circles/twitter-bird-16x16.png" width="12" height="12">
                            <a href="http://twitter.com/${bf.config.twitter.user|u}">Twitter</a> -
                            follow us, say hi!</li>
                        % endif
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
% if bf.config.blog.twitter.widget:
<script charset="utf-8" src="http://widgets.twimg.com/j/2/widget.js"></script>
% endif
% if bf.config.blog.pinterest.enabled:
<script type="text/javascript" src="//assets.pinterest.com/js/pinit.js"></script>
% endif
<script>

// Input placeholders for IE
$(function() {
    $('input, textarea').placeholder();
});

% if bf.config.blog.twitter.widget:
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
  }).render().setUser('${bf.config.blog.twitter.user}').start();
% endif

% if bf.config.blog.twitter.enabled:
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
