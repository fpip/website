site:
	blogofile build

deploy:
	rsync -auvz --filter="exclude, Makefile" _site/ mcrute@softgroup1.finiteloopsoftware.net:/srv/www/frompythonimportpodcast.com/www/htdocs/
