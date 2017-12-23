$blabla = '?onglet=full'
$URL=$1$blabla

eval "wget --random-wait -e robots=off --cookies=on --load-cookies=cookies.txt --keep-session-cookies --referer="http://mediapart.fr" -R 'http://www.mediapart.fr/offre*'  -R 'http://www.mediapart.fr/article/feed' -R '*biographie*' -R 'http://www.mediapart.fr/en/*' -R 'http://www.mediapart.fr/es/*' -R 'http://www.mediapart.fr/sites*' -pmkrNE -l 1 '${URL}'"
