class Project < ActiveRecord::Base
  belongs_to :skill
  validates :title, :presence => true
  validates :content, :presence => true
  validates :link, :presence => true
end
