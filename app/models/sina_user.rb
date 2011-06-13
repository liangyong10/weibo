class SinaUser < ActiveRecord::Base
  has_many:sina_status

  set_primary_key "userID"
end
