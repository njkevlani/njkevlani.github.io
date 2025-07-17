clean:
	rm -rf public

build:
	hugo --minify
	html2pdf --background --paper A4 public/resume/index.html -o public/resume/pdf/Nilesh_Kevlani.pdf

server:
	hugo server --minify --disableLiveReload

server-lan:
	hugo server --minify --disableLiveReload --bind 0.0.0.0

lint:
	typos
	yamllint .
	stylelint "**/*.css"

lint-ci:
	stylelint "**/*.css"
