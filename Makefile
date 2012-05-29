site:
	blogofile build

deploy: site
	rsync -auvz --filter="exclude, Makefile" _site/ /srv/www/frompythonimportpodcast.com/www/htdocs/
