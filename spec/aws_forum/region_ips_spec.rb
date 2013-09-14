require 'spec_helper'

describe AWSForum::RegionIPs do
  before do
    @region_ips = AWSForum::RegionIPs.new
  end
 
  describe "fetch" do
    it "fetches the url and parses the page" do
      @region_ips.fetch.should_not be(nil)
    end
  end

  describe "lookup" do
    it "should be able to parse the Amazon Forum parse and return an array of IP Ranges" do
      expected = ["72.44.32.0/19", "67.202.0.0/18", "75.101.128.0/17", "174.129.0.0/16"]
      found = @region_ips.lookup
      expected.each do |x|
        found.should include(x)
      end
    end
  end

  describe "extract_range" do
    it "is able to extract a range from a single text entry" do
      entry = "204.236.128.0/18 (204.236.128.0 - 204.236.191.255)"
      expected = "204.236.128.0/18"
      @region_ips.extract_range(entry).should eq(expected)
    end
    it "is able to handle a text string and return nil" do
      entry = "some test data"
      expected = nil
      @region_ips.extract_range(entry).should eq(expected)
    end
  end
end
