class Title < ActiveRecord::Base
  has_many :figure_titles
  has_many :firgures, through: :figure_titles
end 
