class Event < ActiveRecord::Base
  attr_accessible :date, :title

  scope :order_by_date, order('date ASC')
  scope :future, where('date >= ?', Date.today)
end
