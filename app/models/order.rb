class Order < ActiveRecord::Base
  attr_accessible :email, :phone, :username
end
