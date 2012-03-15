<%page args="post"/>
<%
   category_links = []
   for category in post.categories:
       category_links.append("<a href='%s'>%s</a>" % (category.path, category.name))
%>
<div class="post hentry category-shows">
    <div class="post-meta post-top-meta">
        <span class="categories-above-post">${", ".join(category_links)}</span>
        <span class="comments-above-post">
        %if bf.config.blog.disqus.enabled:
        <a href="${post.permalink}#disqus_thread">View Comments</a>
        %endif
        </span>
    </div>
    <div class="post-heading">
        <h2 class="post-title"><a href="${post.permapath()}" rel="bookmark">${post.title}</a></h2>
        <p class="post-byline">By ${post.author} on ${post.date.strftime("%B %d, %Y")}</p>
    </div>
    <div class="top-post-body"></div>
    <div class="post-body">${post.content}</div>
</div>
