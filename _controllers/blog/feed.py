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
    write_feed(blog.posts, bf.util.path_join(blog.path, "feed"), "rss.mako")
    write_feed(blog.posts, bf.util.path_join(blog.path, "feed", "atom"),
                          "atom.mako")

def write_feed(posts, root, template):
    root = root.lstrip("/")
    path = bf.util.path_join(root, "index.xml")
    blog.logger.info("Writing RSS/Atom feed: " + path)
    env = {"posts": posts, "root": root, "podcast": Podcast(blog.podcast)}
    bf.writer.materialize_template(template, path, env)
