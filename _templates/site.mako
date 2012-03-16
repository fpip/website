<%def name="filter(chain)">
  ${bf.filter.run_chain(chain, capture(caller.body))}
</%def>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="en-US">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>from python import podcast</title>
        <link rel="stylesheet" type="text/css" href="/static/siteflow/style.css">
        <link rel="alternate" type="application/rss+xml" title="from python import podcast RSS Feed" href="http://frompythonimportpodcast.com/feed">
        <link rel="alternate" type="application/atom+xml" title="from python import podcast Atom Feed" href="http://frompythonimportpodcast.com/feed/atom">
    </head>
    <body>
        <div id="menu">
            <div><a href="/feed">Subscribe &nbsp;<img src="/static/siteflow/rss.png" alt="RSS"></a></div>
        </div><!-- menu -->

        <div id="header">
            <div id="title-headers">
                <div id="title-logo"></div>
                <div id="title-container">
                    <h1 id="site-title"><a href="/">from python import podcast</a></h1>
                    <h4 id="site-blurb">get your snake on</h4>
                </div>
            </div>
        </div><!-- #header -->

        <div id="wrapper">
            <div id="navigation">
                <ul id="category-list">
                    <li class="cat-item cat-item-1"><a href="/about" title="About">About</a></li>
                </ul><!-- #category-list -->

                <div class="divclear"></div>
            </div><!-- #navigation -->

            <div id="content">
                ${next.body()}
            </div><!-- #content -->

            <div id="sidebar">
                <div id="sidebar-widget-area">
                    <div class="widget">
                        <h3 class="widget-header">Subscribe</h3>
                        <div class="textwidget">
                            <ul>
                                <li><a href="http://itunes.apple.com/podcast/from-python-import-podcast/id368205238" rel="alternate" type="application/rss+xml">Subscribe in iTunes</a></li>
                                <li><a href="http://feeds.feedburner.com/FromPythonImportPodcastmp3" rel="alternate" type="application/rss+xml">Subscribe to the podcast (mp3)</a></li>
                                <li><a href="http://feeds.feedburner.com/FromPythonImportPodcastogg" rel="alternate" type="application/rss+xml">Subscribe to the podcast (ogg)</a></li>
                            </ul>
                        </div>
                    </div>

##                    <div class="widget">
##                        <h3 class="widget-header"><a href="http://identi.ca/group/fpip">Our Ident.ca Group</a></h3>
##                        <div id="identica-widget"></div>
##                    </div>
##
                    <div class="widget">
                        <h3 class="widget-header"><a href="http://search.twitter.com/search?q=%23python">Python in the Twitterverse</a></h3>
                        <div id="twitter-widget"></div>
                    </div>
            </div><!-- #sidebar-widget-area -->
        </div><!-- #sidebar -->
        </div><!-- #wrapper -->

        <div id="footer">
            <div id="footer-container">
                <div id="footer-credits">
                    Powered by <a href="http://www.blogofile.com/">Blogofile</a> and the <a href="http://pressplaying.com/">PressPlay Theme</a>
                    <div class="footer-right">Copyright © 2012 from python import podcast</div>
                </div><!-- #footer-credits -->
                <!-- TODO: Anayltics -->
            </div><!-- #footer-container -->
        </div><!-- #footer -->

        <script type="text/javascript">
          var _gaq = _gaq || [];
          _gaq.push(['_setAccount', 'UA-15534287-1']);
          _gaq.push(['_trackPageview']);

          (function() {
            var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
            ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
          })();
        </script>
        <script charset="utf-8" src="http://widgets.twimg.com/j/2/widget.js"></script>
        <script type="text/javascript">
        new TWTR.Widget({
          id: 'twitter-widget',
          version: 2,
          type: 'search',
          search: '#python',
          interval: 30000,
          features: {
            scrollbar: false,
            loop: true,
            live: true,
            behavior: 'default'
          }
        }).render().start();
        </script>
        <style type="text/css">
        .twtr-hd, .twtr-ft { display: none; }
        #twitter-widget div.twtr-doc { background-color: #FFF !important; }
        </style>
    </body>
</html>
