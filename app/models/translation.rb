class Translation < ActiveRecord::Base
  belongs_to  :locale
  has_one     :translation_key
  
  validates :value, :presence => true
end
