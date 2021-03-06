#!/bin/bash
set -eu
source "$(cd $(dirname "${BASH_SOURCE[0]}") &>/dev/null && pwd)/common.sh"

html=''
html+='<ul>'$'\n'
for uname in $(ls -1 "$rwrs_root/users" | sort); do
    if [ -d "/home/$uname/public_html" ]; then
        html+="<li><a href='/~$uname'>$uname</a></li>"$'\n'
    else
        html+="<li>$uname</li>"$'\n'
    fi
done
html+="</ul>"$'\n'
html+="<p><a href='https://github.com/adsr/rw.rs'>join</a></p>"
html+="<p><a href='http://a.rw.rs'>a.rw.rs</a></p>"
html+="<p><a href='https://tildeverse.org/'>tildeverse</a></p>"
echo "$html" >"$htdocs_root/main/FOOTER.html"
