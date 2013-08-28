<%inherit file="site.mako"/>

<%block name="title">${bf.config.blog.name}</%block>

<%block name="header">
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
</%block>

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
                                    | <a href="${bf.config.site.cdn_url}/${latest_show.mp3_file}">Download MP3</a>
                                % endif
                                % if latest_show.ogg_file:
                                    | <a href="${bf.config.site.cdn_url}/${latest_show.ogg_file}">Download OGG</a>
                                % endif
                            </p>
                        </nav>
                        <p><audio controls preload="metadata">
                        % if latest_show.mp3_file:
                            <source type="audio/mpeg" src="${bf.config.site.cdn_url}/${latest_show.mp3_file}" />
                        % endif
                        % if latest_show.ogg_file:
                            <source type="audio/ogg" src="${bf.config.site.cdn_url}/${latest_show.ogg_file}" />
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
                                <li><a href="${post.permapath()}">${post.title}</a></li>
                                % endfor
                            </ul>
                            % if len(shows) > len(recent_shows) + 1:
                            <p><a href="/episodes">More Episodes</a></p>
                            % endif
                        </div>
                        % endif

                        % if top_shows:
                        <div class="five columns">
                            <h5>Top Episodes</h5>
                            <ul>
                                % for post in top_shows:
                                <li><a href="${post.permapath()}">${post.title}</a></li>
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
    % if latest_post or bf.config.twitter.widget:
    <section id="read">
        <div class="container">
            <div class="row">
                <div class="twelve columns">
                    <h3>Read</h3>
                </div>
            </div>

            <div class="row">
                <div class="seven columns">
                    % if latest_post:
                    <article>
                        <h4><a href="${latest_post.permapath()}">${latest_post.title}</a></h4>
                        <p>Published ${latest_post.date.strftime("%B %d, %Y")}</p>
                        ${latest_post.content}

                        <ul class="social-links">
                            % if bf.config.blog.twitter.enabled:
                            <li><a href="https://twitter.com/share"
                                class="twitter-share-button"
                                data-url="${latest_post.permalink}">Tweet</a></li>
                            % endif
                            % if bf.config.blog.googleplus.enabled:
                            <li><div class="g-plusone" data-size="medium"
                                data-href="${latest_post.permalink}"></div></li>
                            % endif
                            % if bf.config.blog.facebook.enabled:
                            <li><div class="fb-like"
                                data-href="${latest_post.permalink}"
                                data-send="false" data-layout="button_count"
                                data-width="100" data-show-faces="false"
                                style="vertical-align:top;"></div></li>
                            % endif
                            % if bf.config.blog.pinterest.enabled:
                            <li><a
                                href="http://pinterest.com/pin/create/button/?url=${latest_post.permalink|u}"
                                class="pin-it-button"
                                count-layout="horizontal"><img border="0"
                                src="//assets.pinterest.com/images/PinExt.png"
                                title="Pin It" /></a></li>
                            % endif
                        </ul>
                    </article>
                    % endif

                    % if recent_posts or featured_posts:
                    <div class="row">
                        % if recent_posts:
                        <div class="five columns">
                            <h5>Previous Posts</h5>
                            <ul>
                                % for post in recent_posts:
                                <li><a href="${post.permapath()}">${post.title}</a></li>
                                % endfor
                            </ul>
                            % if len(posts) > len(recent_posts) + 1:
                            <p><a href="/blog">More Posts</a></p>
                            % endif
                        </div>
                        % endif

                        % if featured_posts:
                        <div class="five columns">
                            <h5>Featured Posts</h5>
                            <ul>
                                % for post in featured_posts:
                                <li><a href="${post.permapath()}">${post.title}</a></li>
                                % endfor
                            </ul>
                        </div>
                        % endif
                    </div>
                    % endif
                </div>

                % if bf.config.blog.twitter.widget:
                <div class="four columns offset-by-one">
                    <h4>Twitter</h4>
                    <p>A little bird told me...</p>

                    <a class="twitter-timeline"
                        height="600"
                        data-dnt="true"
                        data-link-color="#3773a5"
                        href="https://twitter.com/${bf.config.blog.twitter.user}"
                        data-widget-id="${bf.config.blog.twitter.widget_id}">Tweets by @${bf.config.blog.twitter.user}</a>
                    <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>

                </div>
                % endif
            </div>
        </div>
    </section>
    % endif
