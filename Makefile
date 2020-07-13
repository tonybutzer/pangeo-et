publish:
	#git remote set-url origin git@github.com:tonybutzer/pangeo-et.git
	git remote set-url origin https://github.com/tonybutzer/pangeo-et.git
	git config --global user.email tonybutzer@gmail.com
	git config --global user.name tonybutzer
	git config --global push.default simple
	git add .
	git commit -m "automatic git update from Makefile"
	git push

