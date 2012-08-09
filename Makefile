run:
	blogofile build && blogofile serve

update:
	git pull

version:
	echo `git rev-parse HEAD` > version.txt
	echo `date` >> version.txt

site: version
	@ if [ ! -e /home/fpip/repos/fpip_website.git/downloads.txt ]; then \
		ln -s /home/fpip/downloads.txt /home/fpip/repos/fpip_website.git/downloads.txt; \
	fi; done
	blogofile build

deploy: site
	rsync -auvz --filter="exclude, Makefile" _site/ /srv/www/frompythonimportpodcast.com/www/htdocs/
	@ if [ ! -e /srv/www/frompythonimportpodcast.com/www/htdocs/shows ]; then \
		ln -s /srv/www/frompythonimportpodcast.com/www/shows /srv/www/frompythonimportpodcast.com/www/htdocs/shows; \
	fi; done

autopublish: update deploy
