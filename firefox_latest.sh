#!/bin/bash
#===============================================================================
#
#          FILE:  firefox_latest.sh
# 
#         USAGE:  ./firefox_latest.sh 
# 
#   DESCRIPTION:  how to download and install latest firefox distro
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:   (), 
#       COMPANY:  
#       VERSION:  1.0
#       CREATED:  19.08.2021 11:28:45 MSK
#      REVISION:  ---
#===============================================================================

# https://www.mozilla.org/en-US/firefox/new/
sudo tar xvf firefox*tar* -C /opt && rm -f firefox*tar* 

# global .desktop file
sudo tee /usr/share/applications/firefox-stable.desktop > /dev/null <<'EOF'
[Desktop Entry]
Name=Firefox Stable
Comment=Web Browser
Exec=/opt/firefox/firefox %u
Terminal=false
Type=Application
Icon=/opt/firefox/browser/chrome/icons/default/default128.png
Categories=Network;WebBrowser;
MimeType=text/html;text/xml;application/xhtml+xml;application/xml;application/vnd.mozilla.xul+xml;application/rss+xml;application/rdf+xml;image/gif;image/jpeg;image/png;x-scheme-handler/http;x-scheme-handler/https;
StartupNotify=true
EOF

#setting it into global $PATH
sudo ln -s /opt/firefox/firefox /usr/local/bin/firefox

#making it default browser
sudo update-alternatives --install /usr/bin/x-www-browser x-www-browser /opt/firefox/firefox 200 && sudo update-alternatives --set x-www-browser /opt/firefox/firefox
