"""Write the custom homepage."""

from blogofile.cache import bf
import podcastutils

blog = bf.config.controllers.blog

def run():
    write_home_page()

def write_home_page():
    path = bf.util.path_join(blog.path, "index.html")
    blog.logger.info(u"Writing custom homepage of awesomeness: " + path)

    recent_shows = podcastutils.get_recent_shows()
    recent_posts = podcastutils.get_recent_posts()

    try:
        top_shows = podcastutils.get_top_shows(bf.config.blog.homepage.top_shows)
    except:
        blog.logger.exception(u"Error getting top show list")
        top_shows = []

    featured_posts = podcastutils.get_featured_posts(bf.config.blog.homepage.featured_posts)

    env = {
        'shows': blog.shows,
        'posts': blog.posts,
        'recent_shows': recent_shows,
        'recent_posts': recent_posts,
        'top_shows': top_shows,
        'featured_posts': featured_posts,
        'latest_show': blog.shows[0],
        'latest_post': blog.posts_minus_shows[0],
    }

    bf.writer.materialize_template("home_page.mako", path, env)
