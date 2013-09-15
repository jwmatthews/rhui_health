class CheckAWSRegionIpRanges
  attr_accessor :posted_on, :regions, :region_descriptions

  @queue = :lookup_queue
  def self.perform()
    check_aws_forum
    update_db
    # Enqueue a new task to compare ranges against our firewall rules
  end

  def check_aws_forum
    aws_forum = AWSForum::RegionIPs.new
    @posted_on = aws_forum.posted_on
    @regions = aws_forum.lookup
    @region_descriptions = aws_forum.known_regions
  end

  def update_db
    @regions.each_pair do |region_name, region_range|
      aws_region = AwsRegion.where(:name => region_name).first_or_initialize
      aws_region.description = @region_descriptions[region_name]
      aws_region.ip_ranges = region_range
      aws_region.last_aws_forum_check = DateTime.now
      aws_region.last_aws_forum_post = @posted_on
      aws_region.save!
    end
  end
end

