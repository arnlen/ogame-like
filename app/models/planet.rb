class Planet < ActiveRecord::Base
  attr_accessible :name, :coordinates, :metal_ressource, :user_id
  
  validates :name, :coordinates, :user_id, presence: true
  
  belongs_to :user
end
