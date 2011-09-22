class TranslationKey < ActiveRecord::Base
  has_many :translations
  accepts_nested_attributes_for :translations
  
  validates :scope, :tkey, :presence => true
  
  after_create :populate_translations
  
  private
    def populate_translations
      Locale.all.each do |loc|
        translations.create({:value => "", :locale_id => loc.id}) unless loc.master
      end
    end
    
end
