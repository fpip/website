<%page args="post"/>

<%
   category_links = []
   for category in post.categories:
       category_links.append("<a href='%s'>%s</a>" % (category.path, category.name))
%>

<article>
    <h2 class="post-title"><a href="${post.permapath()}" rel="bookmark">${post.title}</a></h2>
    <p class="post-byline">Posted by ${post.author} on ${post.date.strftime("%B %d, %Y")}
    % if bf.config.blog.podcast.explicit == "yes":
    | <img src="/static/images/misc/explicit.png" alt="May contain explicit content">
    %endif

    </p>

    ${post.content}

    % if post.mp3_file or post.ogg_file:
    <p><audio controls preload="metadata">
        % if post.mp3_file:
            <source type="audio/mpeg" src="${bf.config.site.url}/${post.mp3_file}" />
        % endif
        % if post.ogg_file:
            <source type="audio/ogg" src="${bf.config.site.url}/${post.ogg_file}" />
        % endif
    </audio></p>

    <p>
        % if post.mp3_file:
            <a href="${bf.config.site.url}/${post.mp3_file}">Download MP3</a>
        % endif
        % if post.mp3_file and post.ogg_file:
            |
        % endif
        % if post.ogg_file:
            <a href="${bf.config.site.url}/${post.ogg_file}">Download OGG</a>
        % endif
    </p>
    % endif

</article>

<!--
<div class="post hentry category-shows">
<div class="post-meta post-top-meta">
<span class="categories-above-post">${", ".join(category_links)}</span>
<span class="comments-above-post">
%if bf.config.blog.disqus.enabled:
<a href="${post.permalink}#disqus_thread">View Comments</a>
%endif
</span>
</div>
-->
