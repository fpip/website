# -*- coding: utf-8 -*-
site.url = "http://www.frompythonimportpodcast.com"

blog = controllers.blog
blog.custom_index = False
blog.enabled = True
blog.path = ""
blog.name = "From Python Import Podcast"
blog.description = "an irregular podcast for irreverent pythonistas"
blog.timezone = "US/Eastern"

blog.post_default_filters['md'] = blog.post_default_filters['markdown']

blog.podcast.root = "/shows"
blog.podcast.summary = "From Python Import Podcast is a podcast about Python"
blog.podcast.subtitle = "an irregular podcast for irreverent pythonistas"
blog.podcast.explicit = "yes"  # valid values are "yes", "no", and "clean"
blog.podcast.image = "/static/content/fpip3d3-300x300.jpg"
blog.podcast.author = "Chris Miller, Mike Pirnat, Mike Crute, David Stanek, Benjamin W. Smith <christopher@ctmiller.net>"
blog.podcast.categories = ["Technology", ["Business", "Careers"], ["Education", "Training"]]
blog.podcast.keywords = "programming, python, software, development"
blog.podcast.itunes_link = "http://itunes.apple.com/us/podcast/from-python-import-podcast/id525611633"
blog.podcast.mp3_feed = "http://feeds.feedburner.com/FromPythonImportPodcastmp3"
blog.podcast.ogg_feed = "http://feeds.feedburner.com/FromPythonImportPodcastogg"
blog.podcast.full_feed = "http://feeds.feedburner.com/FromPythonImportPodcast"

blog.homepage.recent_posts = 3
blog.homepage.recent_shows = 3
blog.homepage.featured_posts = 3
blog.homepage.top_shows = 3

# social sharing config
blog.facebook.enabled = True
blog.googleplus.enabled = True
blog.pinterest.enabled = True
blog.twitter.enabled = True
blog.twitter.widget = True
blog.twitter.widget_id = "362060480841404416"
blog.twitter.user = "__fpip__"
blog.twitter.related = "codeshaman,mpirnat,dstanek,mcrute,benjaminws"

blog.disqus.enabled = False
