class TranslationKey < ActiveRecord::Base
  has_many :translations
  
  validates :scope, :tkey, :presence => true
end
