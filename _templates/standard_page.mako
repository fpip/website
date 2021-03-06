<%inherit file="site.mako" />

<%block name="header">
<header id="pagehead">
<div class="container">
    <div class="row">
        <div class="twelve columns">
            <img src="/static/images/fpip/4-up-square-50.jpg">
            <h1>${bf.config.blog.name}</h1>
        </div>
    </div>
</div>
</header>
</%block>

<div class="container">
    <div class="row">
        <div class="seven columns">
            <article>
            ${next.body()}
            </article>
        </div>

        <div class="four columns offset-by-one">
            <%include file="sidebar.mako" args="top_shows=top_shows, sidebar_recent_shows=sidebar_recent_shows, sidebar_recent_posts=sidebar_recent_posts, featured_posts=featured_posts" />
        </div>
    </div>
</div>
