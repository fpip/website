<%inherit file="_templates/standard_page.mako" />

<h2>The Blog</h2>

<p>
    On rare occasions, we post things that aren't shows; they're collected here.
</p>

<ul>
    %for post in bf.config.controllers.blog.posts_minus_shows:
        <li><a href="${post.permapath()}">${post.title}</a></li>
    %endfor
</ul>
