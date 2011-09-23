class Translation < ActiveRecord::Base
  belongs_to  :locale
  belongs_to  :translation_key
  
  has_one :master_translation, :class_name => "Translation", :through => :translation_keys, :conditions => ["translations.master = ?", true]
  
end
