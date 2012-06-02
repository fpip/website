site:
	blogofile build

deploy: site
	rsync -auvz --filter="exclude, Makefile" _site/ /srv/www/frompythonimportpodcast.com/www/htdocs/
	ln -s /srv/www/frompythonimportpodcast.com/www/shows /srv/www/frompythonimportpodcast.com/www/htdocs/shows
