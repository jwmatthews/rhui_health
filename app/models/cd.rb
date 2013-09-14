class Cd
  include Mongoid::Document
  field :name, type: String
  field :hostname, type: String
end
