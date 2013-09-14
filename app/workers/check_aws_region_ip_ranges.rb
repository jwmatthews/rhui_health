class CheckAWSRegionIpRanges
  @queue = :lookup_queue
  def self.perform()
    # This is where we will execute code to:
    # 1) Fetch the AWS Forum Post which contains info of AWS IP Ranges
    # 2) Store the updated info in the DB
    # 3) Enqueue a new task to compare ranges against our firewall rules
  end
end

