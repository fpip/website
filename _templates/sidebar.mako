<%page args="top_shows,recent_shows,recent_posts,featured_posts" />

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
    % for post in recent_shows:
    <li><a href="${post.permapath()}">${post.title}</a></li>
    % endfor
</ul>
<p><a href="/shows">More Episodes</a></p>
</section>

<section>
<h4>Recent Posts</h4>
<ul>
    % for post in recent_posts:
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
<div id="twitter-widget"></div>
</section>
% endif

</div>
