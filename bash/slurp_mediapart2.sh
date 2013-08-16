FILE=$1

wget --limit-rate=200k --wait=0.20 \
   -e robots=off \
   --cookies=on --load-cookies=cookies.txt --keep-session-cookies \
   --referer="http://mediapart.fr" \
   -R '*logout*' \
   -R 'http://www.mediapart.fr/offre*'  \
   -R 'http://www.mediapart.fr/article/feed' \
   -R 'http://www.mediapart.fr/biographie*' \
   -R 'http://www.mediapart.fr/en/*' \
   -R 'http://www.mediapart.fr/es/*' \
   -R 'http://www.mediapart.fr/logout*' \
   -R 'http://www.mediapart.fr/bookmark*' \
   -R 'http://www.mediapart.fr/vote/node*' \
   -R 'http://www.mediapart.fr/print*' \
   -R 'http://www.mediapart.fr/offrir_larticle*' \
   -R 'http://www.mediapart.fr/categorie*' \
   -R 'http://www.mediapart.fr/category*' \
   -R 'http://www.mediapart.fr/mot-cle*' \
   -R 'http://www.mediapart.fr/mediapart-sur-mobile*' \
   -R 'http://www.mediapart.fr/parrainage*' \
   -R 'http://www.mediapart.fr/messages*' \
   -pmkrE -l 1 -nc $line \
   -i $FILE
