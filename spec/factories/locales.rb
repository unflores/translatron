Factory.define :locale do

end

Factory.define :master_locale, :parent => :locale do |loc|
  loc.master  { true }
  loc.code    { 'en' }
  loc.name    { 'English' }
end