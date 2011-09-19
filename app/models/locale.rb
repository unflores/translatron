class Locale < ActiveRecord::Base
  has_many :translations
  
  validates :code, :name, :presence => true
  
  def self.master
    where('locales.master = ?', true).limit(1).last
  end
  
end
