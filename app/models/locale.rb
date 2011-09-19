class Locale < ActiveRecord::Base
  has_many :translations
  
  def self.master
    where('locales.master = ?', true).limit(1).last
  end
  
end
