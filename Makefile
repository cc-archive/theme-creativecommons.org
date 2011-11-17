#
# Makefile to build the CSS files that make the site work on current browsers.
#
# ✳ Fabricatorz.
#
#

TODAY=`date +%F`

CSS =	css/normalize.css \
		css/bootstrap-1.2.0.css \
		css/skeleton.css \
		css/primary.styles.css \
		css/media.queries.css \
		css/non-semantic.helper.classes.css \
		css/print.styles.css

CSS_OUTPUT = css/style.css

IE8_CSS =	css/normalize.css \
			css/bootstrap-1.2.0.css \
			css/skeleton.css \
			css/primary.styles.css \
			css/ie8-and-down-proto.css \
			css/media.queries-ie8-and-down.css \
			css/non-semantic.helper.classes.css \
			css/print.styles.css
    
IE8_OUTPUT= css/ie8-and-down.css

# rules

all: ie8 css

css: $(CSS_OUTPUT) $(CSS)
	echo -e '/**' > $(CSS_OUTPUT)
	echo -e ' * THIS FILE IS AUTOGENERATED.' >> $(CSS_OUTPUT)
	echo " * $(TODAY)" >> $(CSS_OUTPUT)
	echo -e ' */' >> $(CSS_OUTPUT)
	cat $(CSS) >> $(CSS_OUTPUT)

ie8: $(IE8_OUTPUT) $(IE8_CSS)
	echo -e '/**' > $(IE8_OUTPUT)
	echo -e ' * THIS FILE IS AUTOGENERATED.' >> $(IE8_OUTPUT)
	echo " * $(TODAY)" >> $(IE8_OUTPUT)
	echo -e ' */' >> $(IE8_OUTPUT)
	cat $(IE8_CSS) >> $(IE8_OUTPUT)


clean:
	rm -f $(CSS_OUTPUT) $(IE8_OUTPUT)

.PHONY: $(CSS_OUTPUT) $(IE8_OUTPUT) all

# run if you using spaces , makefiles need tabs
# vim: set noexpandtab
