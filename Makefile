run:
	blogofile build && blogofile serve

update:
	git pull

version:
	echo `git rev-parse HEAD` > version.txt
	echo `git rev-parse --abbrev-ref HEAD` >> version.txt
	echo `date` >> version.txt

site: version
	@ if [ ! -e /home/fpip/src/website/website.git/downloads.txt ]; then \
		ln -s /home/fpip/downloads.txt /home/fpip/src/website/website.git/downloads.txt; \
	fi; done
	blogofile build

deploy: site
	rsync -auvz --filter="exclude, Makefile" _site/ /home/fpip/www/

autopublish: update deploy
