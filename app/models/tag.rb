class Tag < ActiveRecord::Base

  has_many_and_belongs_to :tickets
  belongs_to :projects

end
