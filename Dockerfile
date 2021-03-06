FROM spozoga/centos-devtools
MAINTAINER Sebastian Pożoga <sebastian@pozoga.eu>

# clone
RUN rm -rf "$GOPATH/src/github.com/goatcms/goatcore" && \
  git clone https://github.com/goatcms/goatcore.git "$GOPATH/src/github.com/goatcms/goatcore" && \
  rm -rf "$GOPATH/src/github.com/goatcms/goatcms" && \
  git clone https://github.com/goatcms/goatcms.git "$GOPATH/src/github.com/goatcms/goatcms" && \
  rm -rf "$GOPATH/src/github.com/goatcms/goatcli" && \
  git clone https://github.com/goatcms/goatcli.git "$GOPATH/src/github.com/goatcms/goatcli" && \
  rm -rf "$GOPATH/src/github.com/goatcms/developer-desktop" && \
  git clone https://github.com/goatcms/developer-desktop.git "$GOPATH/src/github.com/goatcms/developer-desktop"

# prepare desktop symbolic links
RUN ln -s "$GOPATH/src/github.com/goatcms/goatcore" "$HOME/Desktop/goatcore"
RUN ln -s "$GOPATH/src/github.com/goatcms/goatcms" "$HOME/Desktop/goatcms"
RUN ln -s "$GOPATH/src/github.com/goatcms/goatcli" "$HOME/Desktop/goatcli"
RUN ln -s "$GOPATH/src/github.com/goatcms/developer-desktop" "$HOME/Desktop/developer-desktop"

# load image files
ADD image /root/image
RUN find /root/image -type f -regextype posix-extended -iregex '^.*\/((\.[A-Za-z0-9_\-\.]+)|([A-Za-z0-9_\-])|([A-Za-z0-9_\-]+[A-Za-z0-9_\-\.]\.(js|html|po|css|sh|conf|md|txt|json|py)))$' -exec sed -i -e 's/\r//' {} \;
RUN cp -r /root/image/* / && rm -rf /root/image


# add execute privileges to prepare atom shell script
RUN chmod +x "$HOME/Desktop/atom.sh"
RUN chmod +x "$HOME/Desktop/autorun.sh"
