<%inherit file="_templates/standard_page.mako" />

<h2>All Episodes</h2>

<ul>
    %for post in bf.config.controllers.blog.shows:
        <li><a href="${post.permapath()}">${post.title}</a></li>
    %endfor
</ul>
