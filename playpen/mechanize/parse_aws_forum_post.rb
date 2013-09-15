#!/usr/bin/env ruby

require 'mechanize'

def page(url="https://forums.aws.amazon.com/ann.jspa?annID=1701&state=#")
  agent = Mechanize.new
  agent.user_agent = "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64;      Trident/5.0)"
  agent.follow_meta_refresh = true
  agent.redirect_ok = true
  page = agent.get(url)
  page
end

def parse()
  posted_on = nil? 
  page.root.xpath('//td[@class="jive-label"]').each do |x|
    puts "Examining:\n #{x.content}\nNext element is:\n #{x.next_element.content}\n\n"
    if x.content.include?("Posted on")
      posted_on = x.next_element.content.strip
      break
    end
  end
  posted_on
end

posted_on = parse
puts "Posted on date is: '#{posted_on}'"
posted_on_date = DateTime.strptime(posted_on, "%b %e, %Y %l:%M %p")
puts "Converted to DateTime: #{posted_on_date}"

