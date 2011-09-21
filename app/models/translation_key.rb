class TranslationKey < ActiveRecord::Base
  has_many :translations
  accepts_nested_attributes_for :translations
  
  validates :scope, :tkey, :presence => true
end
