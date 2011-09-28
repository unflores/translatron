# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
locs = Locale.create([
  { :name => 'English', :code => 'en', :master => true  },
  { :name => 'Spanish', :code => 'es', :master => false },
  { :name => 'French',  :code => 'fr', :master => false }
])

locales = Locale.all

translation_keys = TranslationKey.create([
  { :scope => 'the.scope', :tkey => 'the_key'  },
  { :scope => 'the.scope', :tkey => 'the_key1' }
])

translation_keys.each do |trans_key|
  trans = Translation.create({ :value => 'some_value', :translation_key => trans_key, :locale => locs.first})
  trans.update_attributes({ :master_translation => trans })
end
