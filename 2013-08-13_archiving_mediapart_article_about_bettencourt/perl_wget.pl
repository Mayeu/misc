
use strict ;
use warnings;

my $file = "bettencourt.txt" ;
open my $fh, $file or die "lol" ;

while( my $line = <$fh>)  {
    $line =~ s/\r|\n//g;
    chomp $line ;
    `wget --limit-rate=200k --wait=0.20 -e robots=off --cookies=on --load-cookies=cookies.txt --keep-session-cookies --referer="http://mediapart.fr" -R 'http://www.mediapart.fr/offre*'  -R 'http://www.mediapart.fr/article/feed' -R '*biographie*' -R 'http://www.mediapart.fr/en/*' -R 'http://www.mediapart.fr/es/*' -R '*logout*' -R '*bookmark*' -R '*vote/node*' -R '*/print/*' -R '*offrir_larticle*' -R '*/categorie*' -R '*/biographie*' -pmkrE -l 1 -nc $line` ;
    sleep 1;
}

close $fh;
