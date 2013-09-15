class Instance
  include Mongoid::Document
  field :role, type: String
  field :region, type: String
  field :hostname, type: String
  field :ec2_public_hostname, type: String
  field :ssh_key, type: String
end
