clean:
	rm -rf public

build:
	hugo --minify
	html2pdf --background --paper A4 public/resume/index.html -o public/resume/pdf/Nilesh_Kevlani.pdf

server:
	hugo server --minify

lint:
	typos
	yamllint .
	stylelint "**/*.css"

lint-ci:
	stylelint "**/*.css"
