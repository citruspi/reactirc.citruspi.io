COMMIT:=$(shell git log -1 --pretty=format:'%H')
BRANCH:=$(TRAVIS_BRANCH)

ifeq ($(strip $(BRANCH)),)
	BRANCH:=$(shell git branch | sed -n -e 's/^\* \(.*\)/\1/p')
endif

all: clean dist

clean:

	rm -rf dist
	rm -rf release

dist:

	ljon

release: clean dist

	mkdir release
	cd public && zip -r ../public.zip .

	cp public.zip release/$(COMMIT).zip
	cp public.zip release/$(BRANCH).zip

	rm public.zip

PHONY: clean
