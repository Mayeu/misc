#! /usr/bin/env ruby

require 'nokogiri'
require 'pp'
require 'uri'
require 'pathname'

data = Nokogiri::XML File.open("./wordpress.xml")

items = data.xpath('//item')

items.each do | it |
  post_type = it.at_xpath("wp:post_type").content

  if post_type == "attachment"
    current_title = it.at_xpath("title").content
    if current_title == ""
      (_,_,_,_,_,path) = URI::split it.at_xpath("wp:attachment_url").content
      new_title = Pathname.new(path).basename.to_s
      it.at_xpath("title").content = new_title
    end
  end
end

puts data.to_xml
