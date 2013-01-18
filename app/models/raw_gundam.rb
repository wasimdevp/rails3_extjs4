class RawGundam < ActiveRecord::Base
  attr_accessible :url, :period, :name, :name_chs, :name_jp, :model, :usage, :force, :story, :manufactory, :specifications, :internal_environment, :measurement, :weight, :armor, :output, :propulsion, :acceleration, :special_equipped, :default_weapon, :selected_weapon, :hand_weapon, :ranged_weapon, :summary, :created_at, :updated_at
end