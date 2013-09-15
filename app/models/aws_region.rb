class AwsRegion
  include Mongoid::Document
  field :name, type: String
  field :description, type: String
  field :ip_ranges, type: Array
  field :last_aws_forum_check, type: DateTime
  field :last_aws_forum_post, type: DateTime
end
