# -*- coding: utf-8 -*-
site.url = "http://www.frompythonimportpodcast.com"

blog = controllers.blog
blog.custom_index = False
blog.enabled = True
blog.path = ""
blog.name = "From Python Import Podcast"
blog.description = "an irregular podcast for irreverent pythonistas"
blog.timezone = "US/Eastern"

blog.podcast.root = "/shows"
blog.podcast.summary = "From Python Import Podcast is a podcast about Python"
blog.podcast.subtitle = "an irregular podcast for irreverent pythonistas"
blog.podcast.explicit = "yes"  # valid values are "yes", "no", and "clean"
blog.podcast.image = "/static/content/fpip3d3-300x300.jpg"
blog.podcast.author = "Chris Miller, Mike Pirnat, Mike Crute, David Stanek, Benjamin W. Smith <christopher@ctmiller.net>"
blog.podcast.categories = ["Technology", ["Business", "Careers"], ["Education", "Training"]]
blog.podcast.keywords = "programming, python, software, development"

blog.homepage.recent_shows = 3
blog.homepage.top_shows = 3
