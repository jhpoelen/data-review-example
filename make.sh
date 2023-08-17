#!/bin/bash
#


function render() {
 ls -1 | grep .md$ | grep -v README | xargs cat\
 | pandoc --embed-resources -s --to ${1} --citeproc -o -\
 > output/report.${1}
}

function render_readme() {
 cat <(ls -1 | grep .md$ | grep -v README | xargs cat\
 | pandoc --embed-resources -s --to gfm --citeproc -o -)\
 > README.md
}


render docx 
render pdf
render rtf
render html
render_readme
