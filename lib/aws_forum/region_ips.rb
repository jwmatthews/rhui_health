require 'mechanize'

module AWSForum
  class RegionIPs

    def lookup
      raw_page = fetch
      parse raw_page
    end

    def fetch(url="https://forums.aws.amazon.com/ann.jspa?annID=1701&state=#")
      agent = Mechanize.new
      agent.user_agent = "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64;      Trident/5.0)"
      agent.follow_meta_refresh = true
      agent.redirect_ok = true
      page = agent.get( url )
      page
    end

    def parse(page)
      ipranges = page.at(".jive-body").children.map do |x| 
        if x.node_name == "text"
          extract_range x.content 
        else 
          nil
        end
      end
      ipranges.delete_if {|x| x.nil?}
    end

    def extract_range(entry)
      #Example:   "204.236.128.0/18 (204.236.128.0 - 204.236.191.255)"
      m = entry.match(/(\d*\.\d*.\d*.\d*\/\d*)/m)
      if m
        return m.captures[0]
      end
      return nil
    end

    def posted_on(page)
      search_str = "Posted on"
      # Find "Posted on" <td> element, then grab date from next <td>
    end
  end
end
