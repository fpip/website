<%page args="top_shows,sidebar_recent_shows,sidebar_recent_posts,featured_posts" />

<div id="sidebar">

<section>
<h4>Top Episodes</h4>
<ul>
    % for post in top_shows:
    <li><a href="${post.permapath()}">${post.title}</a></li>
    % endfor
</ul>
</section>

<section>
<h4>Recent Episodes</h4>
<ul>
    % for post in sidebar_recent_shows:
    <li><a href="${post.permapath()}">${post.title}</a></li>
    % endfor
</ul>
<p><a href="/episodes">More Episodes</a></p>
</section>

<section>
<h4>Recent Posts</h4>
<ul>
    % for post in sidebar_recent_posts:
    <li><a href="${post.permapath()}">${post.title}</a></li>
    % endfor
</ul>
<p><a href="/blog">More Posts</a></p>
</section>

% if featured_posts:
<section>
<h4>Featured Posts</h4>
<ul>
    % for post in featured_posts:
    <li><a href="${post.permapath()}">${post.title}</a></li>
    % endfor
</ul>
</section>
% endif

% if bf.config.blog.twitter.widget:
<section>
<h4>Twitter</h4>
<a class="twitter-timeline"
    height="600"
    data-dnt="true"
    data-link-color="#3773a5"
    href="https://twitter.com/${bf.config.blog.twitter.user}"
    data-widget-id="${bf.config.blog.twitter.widget_id}">Tweets by @${bf.config.blog.twitter.user}</a>
<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>
</section>
% endif

<%include file="pycon2014.mako" />
<%include file="gratipay.mako" />
<%include file="rackspace.mako" />

</div>
