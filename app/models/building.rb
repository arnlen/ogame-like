class Building < ActiveRecord::Base
  attr_accessible :init_price, :init_time, :level, :name, :planet_id
end
