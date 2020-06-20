#FROM squidfunk/mkdocs-material:5.3.0
FROM minidocks/mkdocs
MAINTAINER gisolfi@us.ibm.com

#----------------------------------------------------
# Install MkDocs environment w/complimentary tools
#----------------------------------------------------

#RUN apk add gcc-plugin-devel python-devel python-six python-pygments graphviz
#RUN apk --update --upgrade add bash cairo pango gdk-pixbuf py3-cffi py3-pillow py-lxml
#RUN pip3 install --upgrade pip
#RUN pip3 install weasyprint

#RUN pip3 install mkpdfs-mkdocs==1.0.1
#RUN pip3 install mkdocs-pdf-export-plugin

ENV ENABLE_PDF_EXPORT=0

#----------------------------------------------------
# Prepare GitHub Action
#----------------------------------------------------

COPY action.sh /action.sh

RUN apk add --no-cache bash && chmod +x /action.sh

ENTRYPOINT ["/action.sh"]
