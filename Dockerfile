#----------------------------------------------------
# Leverage pre-built MkDocs w/WeasyPrint
#----------------------------------------------------

FROM minidocks/mkdocs:1.0-pdf
MAINTAINER vinomaster (dan.gisolfi@ugmail.com)

#----------------------------------------------------
# Disable PDF Plugin for GitHub Pages Deployment
#----------------------------------------------------

ENV ENABLE_PDF_EXPORT=0

#----------------------------------------------------
# Prepare GitHub Action
#----------------------------------------------------

RUN apk add git git-fast-import

COPY action.sh /action.sh

RUN apk add --no-cache bash && chmod +x /action.sh

ENTRYPOINT ["/action.sh"]
