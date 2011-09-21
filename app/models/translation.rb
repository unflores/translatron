class Translation < ActiveRecord::Base
  belongs_to  :locale
  belongs_to     :translation_key
  
  validates :value, :presence => true
end
