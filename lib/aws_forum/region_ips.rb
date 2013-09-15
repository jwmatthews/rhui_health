require 'mechanize'

module AWSForum

  class RegionIPs

    def known_regions
      regions = Hash.new
      regions["us-east-1"] = "US East (Northern Virginia)" 
      regions["us-west-1"] = "US West (Northern California)" 
      regions["us-west-2"] = "US West (Oregon)"
      regions["eu-west-1"] = "EU (Ireland)"
      regions["ap-southeast-1"] = "Asia Pacific (Singapore)"
      regions["ap-southeast-2"] = "Asia Pacific (Sydney)"
      regions["ap-northeast-1"] = "Asia Pacific (Tokyo)"
      regions["sa-east-1"] = "South America (Sao Paulo)"
      regions["govclod_tbd"] = "GovCloud"
      regions
    end

    def raw_page()
      @raw_page ||=fetch
    end

    def posted_on()
      """
      Returns the date this announcement was posted, or nil if unable to parse
      """
      posted_on_date = nil? 
      raw_page.root.xpath('//td[@class="jive-label"]').each do |x|
        if x.content.include?("Posted on")
          posted_on_date = x.next_element.content.strip
          break
        end
      end
      posted_on_date
    end

    def lookup
      parse raw_page
    end

    def fetch(url="https://forums.aws.amazon.com/ann.jspa?annID=1701&state=#")
      agent = Mechanize.new
      agent.user_agent = "Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64;      Trident/5.0)"
      agent.follow_meta_refresh = true
      agent.redirect_ok = true
      page = agent.get(url)
      page
    end

    def parse(page)
      """
      Returns a hash with the key of each region and the values as an array of each IP Range.

      Assumes that page has written the IP Ranges grouped by regions.
      Entries will be:
       Region-A description
         range1
         range2
         ...
       Region-B description
         ....
      """
      current_region = nil  # Markes what region we are processing
      ranges = Hash.new
      text_nodes = page.root.css(".jive-body").children.select { |x| x.node_name == "text"}
      text_nodes.each do |line|
        entry = line.content
        iprange = extract_range entry
        if not iprange.nil?
          if current_region.nil?
            raise Exception("Found an IP Range <#{iprange}> that is not inside a Region Description block.")
          end
          ranges[current_region].append(iprange)
        else
          known_regions.each_pair do |region_id, region_description|
            if entry.include?(region_description)
              current_region = region_id
              ranges[current_region] = []
              break
            end
          end
        end
      end
      ranges
    end

    def extract_range(entry)
      #Example:   "204.236.128.0/18 (204.236.128.0 - 204.236.191.255)"
      m = entry.match(/(\d*\.\d*.\d*.\d*\/\d*)/m)
      if m
        return m.captures[0]
      end
      return nil
    end

    
  end
end
