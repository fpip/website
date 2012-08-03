site:
	ln -s /home/fpip/downloads.txt /home/fpip/repos/fpip_website.git/downloads.txt
	blogofile build

deploy: site
	rsync -auvz --filter="exclude, Makefile" _site/ /srv/www/frompythonimportpodcast.com/www/htdocs/
	ln -s /srv/www/frompythonimportpodcast.com/www/shows /srv/www/frompythonimportpodcast.com/www/htdocs/shows

run:
	blogofile build && blogofile serve
