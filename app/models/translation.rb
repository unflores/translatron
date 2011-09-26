class Translation < ActiveRecord::Base
  belongs_to  :locale
  belongs_to  :translation_key
  
  belongs_to :master_translation, :class_name => "Translation", :foreign_key => 'master_translation_id'

  after_create :set_master_translation  

  scope :master_translations, where('id = master_translation_id')

  def self.master id
    Translation.master_translations.where( "translation_key_id = ?", id ).last
  end

  def set_master_translation
    if locale.master == true
      update_attributes({:master_translation => self})
    end
  end

end
