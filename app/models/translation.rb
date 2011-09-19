class Translation < ActiveRecord::Base
  belongs_to  :locale
  has_one     :translation_key
end
