class Survey < ActiveRecord::Base
  attr_accessible :email, :would_charge, :would_pay, :ipaddress, :useragent
end
