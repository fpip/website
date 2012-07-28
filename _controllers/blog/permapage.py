import urlparse
import re
import podcastutils
from blogofile.cache import bf

blog = bf.config.controllers.blog


def run():
    write_permapages()


def write_permapages():
    "Write blog posts to their permalink locations"
    site_re = re.compile(bf.config.site.url, re.IGNORECASE)
    num_posts = len(blog.posts)

    recent_shows = podcastutils.get_recent_shows()
    recent_posts = podcastutils.get_recent_posts()
    try:
        top_shows = podcastutils.get_top_shows(bf.config.blog.homepage.top_shows)
    except:
        blog.logger.exception(u"Error getting top show list")
        top_shows = []
    featured_posts = podcastutils.get_featured_posts(bf.config.blog.homepage.featured_posts)
    
    for i, post in enumerate(blog.posts):
        if post.permalink:
            path = site_re.sub("", post.permalink)
            blog.logger.info(u"Writing permapage for post: {0}".format(path))
        else:
            #Permalinks MUST be specified. No permalink, no page.
            blog.logger.info(u"Post has no permalink: {0}".format(post.title))
            continue

        env = {
            "post": post,
            "posts": blog.posts,
            "recent_shows": recent_shows,
            "recent_posts": recent_posts,
            "top_shows": top_shows,
            "featured_posts": featured_posts,
            "latest_show": blog.shows[0],
            "latest_post": blog.posts_minus_shows[0],
        }

        #Find the next and previous posts chronologically
        if i < num_posts - 1:
            env['prev_post'] = blog.posts[i + 1]
        if i > 0:
            env['next_post'] = blog.posts[i - 1]
        
        bf.writer.materialize_template(
                "permapage.mako", bf.util.path_join(path, "index.html"), env)
