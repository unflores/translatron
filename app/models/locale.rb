class Locale < ActiveRecord::Base
  validates :code, :name, :presence => true
  validates :code, :uniqueness => true
  
  has_many :translations
  
  after_create :populate_translations
  
  def self.master
    where('locales.master = ?', true).limit(1).last
  end
  
  private
    
    def populate_translations
      TranslationKey.all.each do |tk|
        translations.create({ :value => "", :needs_update => true, :locale_id => id })
      end
    end
  
end
