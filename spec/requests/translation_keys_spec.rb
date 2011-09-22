require 'spec_helper'

describe "TranslationKeys" do
  describe "POST /translation_keys" do
    def valid_attributes
      {"translation_key" => { "translation" => {"value"=>"kooky"}, "scope"=>"pants", "tkey"=>"lawry" } }
    end
    
    before(:each) do
      @master_locale  = Factory :master_locale
      @locale         = Factory :locale, { :code => 'ps', :name => "Protrocleakon" }
    end
    
    it "attaches a translation for each locale" do
      post translation_keys_path, valid_attributes
      
      @tk = TranslationKey.last
      @tk.translations.count.should == 2
      
      Locale.last.translations.each do |trans|
        if trans.locale == @master_locale
          trans.value.should_not == ""
        else
          trans.value.should == ""
        end
      end
    end
    
  end
end