class FigureTitle < ActiveRecord::Base
  binding.pry
  belongs_to :title
  belongs_to :figure
end 
