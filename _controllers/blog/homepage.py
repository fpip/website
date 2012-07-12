"""Write the custom homepage."""

from blogofile.cache import bf

blog = bf.config.controllers.blog

def run():
    write_home_page()

def write_home_page():
    path = bf.util.path_join(blog.path, "index.html")
    blog.logger.info(u"Writing custom homepage of awesomeness: " + path)

    try:
        top_shows = get_top_shows(bf.config.blog.homepage.top_shows)
    except:
        blog.logger.exception(u"Error getting top show list")
        top_shows = []

    recent_shows = blog.shows[1:bf.config.blog.homepage.recent_shows+1]

    env = {
        'shows': blog.shows,
        'posts': blog.posts,
        'recent_shows': recent_shows,
        'top_shows': top_shows,
        'latest_show': blog.shows[0],
        'latest_post': blog.posts[0],
    }

    bf.writer.materialize_template("home_page.mako", path, env)


def get_top_shows(how_many):
    # get the raw data
    f = open("downloads.txt", 'r')
    data = f.read()
    f.close()

    # parse it into list of tuples of count and episode, sorted from most
    # to least downloads:
    #    [(count, episode), (count1, episode1), ...]
    episode_counts = [(int(x[1]), x[0])
            for x in (x.split() for x in data.split('\n'))
            if len(x) > 1 and x[1].isdigit()]

    episode_counts.sort()
    episode_counts.reverse()

    # grab the top N episodes
    top_downloads = episode_counts[:how_many]

    # walk the top N to find Post objects and their permalinks
    top_shows = []
    for count, episode in top_downloads:
        for post in blog.shows:
            if (post.mp3_file and episode + ".mp3" in post.mp3_file) \
                    or (post.ogg_file and episode + ".ogg" in post.ogg_file):
                top_shows.append(post)
    return top_shows
