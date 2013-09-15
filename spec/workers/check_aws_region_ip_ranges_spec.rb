require 'spec_helper'

describe CheckAWSRegionIpRanges do
  before do
    @check_aws = CheckAWSRegionIpRanges.new
  end

  describe "check_aws_forum" do
    it "should update instance variables after fetching data from AWS Forum" do
      @check_aws.instance_variable_defined?("@posted_on").should be(false)
      @check_aws.instance_variable_defined?("@regions").should be(false)
      @check_aws.instance_variable_defined?("@region_descriptions").should be(false)
      # Perform the AWS Forum Lookup
      @check_aws.check_aws_forum()
      # Verify data has been updated
      @check_aws.posted_on.should_not be(nil)
      @check_aws.regions.should include("us-east-1")
      @check_aws.region_descriptions.values.should include("US East (Northern Virginia)")
    end
  end

  describe "update_db" do
    it "should update the DB with values obtained from AWS Forum" do
      # Verify Database is empty
      AwsRegion.count.should be(0)
      # Create dummy data and add to class 
      now = DateTime.now
      regions = {"test_region_name" => ["range1", "range2"]}
      region_descriptions = {"test_region_name" => "test_region_description"}
      @check_aws.posted_on = now
      @check_aws.regions = regions
      @check_aws.region_descriptions = region_descriptions
      # Call the db update
      @check_aws.update_db
      # Verify what we expected was written to the DB
      saved_aws_region = AwsRegion.first
      saved_aws_region.name.should eq("test_region_name")
      saved_aws_region.description.should eq("test_region_description")
      saved_aws_region.ip_ranges.should include("range1")
      saved_aws_region.ip_ranges.should include("range2")
      saved_aws_region.last_aws_forum_check.should be_within(1).of(now)
      saved_aws_region.last_aws_forum_post.should be_within(1).of(now)
    end
  end

end