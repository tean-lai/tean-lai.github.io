all:
	# hugo server --noHTTPCache --buildDrafts
	hugo server --disableFastRender

clean:
	rm -rf public