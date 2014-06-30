###
### Makefile for Humdrum website documentation.
###

###########################################################################
##
## Default action: list actions makefile can do.  Type "make" to see the list.
##

all:
	@echo
	@echo "[0;32mmake doc[0m     -- Create HTML documentation pages."
	@echo "[0;32mmake publish[0m -- Commit and then publish updates to Humdrum website."
	@echo


##########################################################################
##
## Remove all automatically generated files/directories:
##

clean: clean-links
	-rm -rf html


###########################################################################
## 
## Create HTML documentation files in ./html, and add symbolic links to
## base directory.
##

doc: webpages clean-links links css-hack sidebar-adjust
	
website:   webpages
dirhtml:   webpages
html:	   webpages
webpage:   webpages
webpages:
	(cd source; $(MAKE) dirhtml)


css-hack:
	# Change RtD theme CSS settings which don't want to be change otherwise
	# Sidebar background color: 343131 -> 3d5b73
	# Sidebar search region at top: 2980b9 -> 3d5b73 (but not links or other)
	-(cd html/_static/css; cp theme.css theme-old.css)
	-(cd html/_static/css; sed 's/343131/3d5b73/g; s/background-color:#2980b9/background-color:#3d5b73/g' theme-old.css > theme.css)


sidebar-adjust:
	bin/adjustsidebar html

###########################################################################
##
## The webpages target compiles the source documents in the "source" directory
## and then create web pages in the "html" directory.  The links make target
## creates symbolic links to files and directories in the html subdirectory
## onto the base directory to be used from the web address:
##      http://www.humdrum.org
##

link:      links
links:
	for file in `ls -a html | egrep -v '^\.+$$'`; \
	do					     \
	   ln -s html/$$file .;			     \
	done



###########################################################################
##
## Erase all links to HTML content in html directory.  This command
## will not delete any real directories, but will delete any of the 
## links if they are actually real files.
cleanlinks: clean-links
clean-links:
	-for file in `ls -a html | egrep -v '^\.+$$'`; \
	do					     \
	   rm $$file;				     \
	done



###########################################################################
##
## Publish the website (with any new changes):
##

push: 	  git-push
update:   git-push
gitpush:  git-push
git-push:
	git push



###########################################################################
## 
## Add new files, commit changes and then push to GitHub (This target
## does not compile the source code, however).
##

auto:	     auto-upload
autoupdate:  auto-upload
auto-update: auto-upload
auto-push:   auto-upload
autopush:    auto-upload
autoupload:  auto-upload
auto-upload: git-add git-commit git-push



###########################################################################
##
## Start tracking any new files in the git version control system.  You
## need to then do git-commit to store in control system.  Type the command
## "git status" to see a list of any new or change files, preferably
## before you run this command to make sure no junk files start to be 
## tracked.
##

add:         git-add
gitadd:      git-add
git-add:
	git add .



###########################################################################
##
## Commit changes to the git repository.  If there are any new files,
## you should run "make git-add" or "get add ." first.  The commited 
## changes will need to be placed on the website with "make push" or
## "git push" after this command is run.
##

commit:      git-commit
gitcommit:   git-commit
git-commit:
	git commit -a


###########################################################################
##
##  Lazy ways to push changes to the website all in one step:
##

# Compile HTML files, then add, commit and push git repository to website.
updater: doc publish
	
# Upload without compiling website (you should run "make doc" first:
publish: auto-update


