all:
	# hugo server --noHTTPCache --buildDrafts
	hugo server --buildDrafts

clean:
	rm -rf public