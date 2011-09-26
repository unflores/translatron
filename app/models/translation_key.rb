class TranslationKey < ActiveRecord::Base
  validates :scope, :tkey, :presence => true
  
  has_many :translations
  
  after_create :populate_translations
  
  private
    def populate_translations
      master = Translation.master id
      
      Locale.all.each do |loc|
        unless loc.master
          translations.create({
            :value              => "", 
            :needs_update       => true, 
            :locale_id          => loc.id, 
            :master_translation => master
          }) 
        end
      end
    end
    
end
