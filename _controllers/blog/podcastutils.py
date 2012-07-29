from blogofile.cache import bf
blog = bf.config.controllers.blog
global_tvars = bf.config.site.template_vars


def get_recent_shows():
    recent_shows = blog.shows[1:bf.config.blog.homepage.recent_shows+1]
    global_tvars['recent_shows'] = recent_shows
    return recent_shows


def get_recent_posts():
    recent_posts = blog.posts_minus_shows[1:bf.config.blog.homepage.recent_posts+1]
    global_tvars['recent_posts'] = recent_posts
    return recent_posts


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
    global_tvars['top_shows'] = top_shows
    return top_shows


def get_featured_posts(how_many):
    featured_posts = [post for post in blog.posts if post.featured][:how_many]
    global_tvars['featured_posts'] = featured_posts
    return featured_posts
