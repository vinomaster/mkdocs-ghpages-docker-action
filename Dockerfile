#FROM squidfunk/mkdocs-material:5.3.0
FROM minidocks/mkdocs:1.0-pdf  
MAINTAINER gisolfi@us.ibm.com

RUN apk add git

ENV ENABLE_PDF_EXPORT=0

#----------------------------------------------------
# Prepare GitHub Action
#----------------------------------------------------

COPY action.sh /action.sh

RUN apk add --no-cache bash && chmod +x /action.sh

ENTRYPOINT ["/action.sh"]
