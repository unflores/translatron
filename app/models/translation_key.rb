class TranslationKey < ActiveRecord::Base
  validates :scope, :tkey, :presence => true
  
  has_many :translations
  
  after_create :populate_translations
  
  private
    def populate_translations
      Locale.all.each do |loc|
        translations.create({:value => "", :needs_update => true, :locale_id => loc.id}) unless loc.master
      end
    end
    
end
