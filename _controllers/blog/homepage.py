"""Write the custom homepage."""

from blogofile.cache import bf

blog = bf.config.controllers.blog

def run():
    write_home_page()

def write_home_page():
    path = bf.util.path_join(blog.path, "index.html")
    blog.logger.info(u"Writing custom homepage of awesomeness: " + path)
    env = {
        'shows': blog.shows,
        'posts': blog.posts,
    }
    bf.writer.materialize_template("home_page.mako", path, env)
