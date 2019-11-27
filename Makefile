
EXTENSION = pgq_ext

EXT_VERSION = 3.1
EXT_OLD_VERSIONS =

Contrib_regress = init_noext test_pgq_ext test_upgrade
Extension_regress = init_ext test_pgq_ext

include mk/common-pgxs.mk

dox: cleandox $(SRCS)
	mkdir -p docs/html
	mkdir -p docs/sql
	$(CATSQL) --ndoc structure/tables.sql > docs/sql/schema.sql
	$(CATSQL) --ndoc structure/upgrade.sql > docs/sql/functions.sql
	$(NDOC) $(NDOCARGS)

deb:
	make -f debian/rules genfiles
	debuild -us -uc -b

debclean:
	make -f debian/rules debclean

TARNAME = $(EXTENSION)-$(EXT_VERSION)
dist:
	git archive --format=tar.gz --prefix=$(TARNAME)/ -o $(TARNAME).tar.gz HEAD

