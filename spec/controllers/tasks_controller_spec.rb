require 'spec_helper'

describe TasksController do

  describe "GET 'sync_aws_forum_ip_ranges'" do
    it "returns http success" do
      get 'sync_aws_forum_ip_ranges'
      response.should be_success
    end
  end

end
