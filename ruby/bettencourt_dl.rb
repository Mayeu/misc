require 'mechanize'
require 'logger'
#require 'mechanize/progressbar'

# Mechanize the shit
a = Mechanize.new { |a|
   a.log = Logger.new('bettencourt.log')
   # Om nom nom nom nom nom nom nom :3
   a.cookie_jar.load('cookies.txt', :cookiestxt)
   #a.pluggable_parser.default = Mechanize::Download
}

# Open the link file
link_file=File.open(ARGV[0]).read
#link_file.gsub!(/\r\n?/, "\n") # remove windows shit

# Loop for the world
link_file.each_line do |url|

   url.chomp!

   # Wait a little
   sleep 1

   # Get the URL
   a.get(url) do |article_to_dl|

      # Get the article name (to sym to string again to remove special char)
      name = article_to_dl.at('h1').content.downcase!
      
      # Cleaning name
      name.tr!('àâéêèîôûù','aaeeeiouu') # Accent
      name.tr!(',:/«”“»?!:.','_') # Symbol
      name.gsub!(/'/, '')
      name.gsub!(/’/, '')
      name.gsub!(/\s+/, '_')
      name.gsub!(/ /, '_')
      name.gsub!(/_{2,}/,'_')
      name.chomp!('_')

      # Get the date
      # Date are in the url, with the following (dumb) form : DDMMYY
      adate = (url.split('/'))[-2].split('')
      date = '20' + adate[4] + adate[5] +'_'+ adate[2] + adate[3] +'_'+ adate[0] + adate[1]

      # Download the pdf
      begin
         article_to_dl.links_with(:href => %r{^/pdf}).first.click.save('mediapart_pdf_bettencourt/mediapart_'+date+'_'+name+'.pdf') # save it
      rescue
         print "Fail for: " + url
      end

   end

end
