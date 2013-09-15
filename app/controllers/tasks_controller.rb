class TasksController < ApplicationController
  def sync_aws_forum_ip_ranges
    check_aws = CheckAWSRegionIpRanges.new
    check_aws.check_aws_forum
    check_aws.update_db
    render :json => {
      "status" => "success",
      "posted_on" => check_aws.posted_on
    }
  end
end
