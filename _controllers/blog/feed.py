import re
from blogofile.cache import bf

blog = bf.config.controllers.blog


class Podcast(object):

    def __init__(self, config):
        self.config = config
        self.email_re = re.compile("([^<]*)<([^>]*)>")

    def __getattr__(self, name):
        return getattr(self.config, name)

    @property
    def explicit(self):
        return "no" if not self.config.explicit else "yes"

    @property
    def owner_name(self):
        return self.email_re.match(self.config.author).groups()[0].strip()

    @property
    def owner_email(self):
        return self.email_re.match(self.config.author).groups()[1].strip()

    @property
    def itunes_summary(self):
        summary = self.config.summary
        summary = re.sub("<[^>]*>", "", summary).replace("\n", " ").strip()
        return summary[:1000] + "..." if len(summary) > 1000 else summary



def run():
    extras = {}

    write_feed(blog.posts, bf.util.path_join(blog.path, "feed"), "rss.mako",
            extra_env=extras)
    write_feed(blog.posts, bf.util.path_join(blog.path, "feed", "atom"),
            "atom.mako", extra_env=extras)

    if blog.podcast:
        mp3_posts = [post for post in blog.posts if post.mp3_file]
        extras['enclosure_flavor'] = 'mp3'
        write_feed(mp3_posts, bf.util.path_join(blog.path, "feed", "mp3"),
                "rss.mako", extra_env=extras)

        ogg_posts = [post for post in blog.posts if post.ogg_file]
        extras['enclosure_flavor'] = 'ogg'
        write_feed(ogg_posts, bf.util.path_join(blog.path, "feed", "ogg"),
                "rss.mako", extra_env=extras)


def write_feed(posts, root, template, extra_env=None):
    extra_env = extra_env or {}

    if blog.podcast:
        extra_env['podcast'] = Podcast(blog.podcast)

    root = root.lstrip("/")
    path = bf.util.path_join(root, "index.xml")
    blog.logger.info("Writing RSS/Atom feed: " + path)

    env = {"posts": posts, "root": root}
    env.update(extra_env)

    bf.writer.materialize_template(template, path, env)
