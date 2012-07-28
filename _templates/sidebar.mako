<%page args="top_shows,recent_shows,recent_posts,featured_posts" />

<h4>Top Episodes</h4>
<ul>
    % for post in top_shows:
    <li><a href="${post.permapath()}">${post.title}</a></li>
    % endfor
</ul>

<h4>Recent Episodes</h4>
<ul>
    % for post in recent_shows:
    <li><a href="${post.permapath()}">${post.title}</a></li>
    % endfor
</ul>

<h4>Recent Posts</h4>
<ul>
    % for post in recent_posts:
    <li><a href="${post.permapath()}">${post.title}</a></li>
    % endfor
</ul>

% if featured_posts:
<h4>Featured Posts</h4>
<ul>
    % for post in featured_posts:
    <li><a href="${post.permapath()}">${post.title}</a></li>
    % endfor
</ul>
% endif

% if bf.config.blog.twitter.widget:
    <h4>Twitter</h4>
    <div id="twitter-widget"></div>
% endif

