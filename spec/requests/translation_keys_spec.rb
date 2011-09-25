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
    
    it "attaches a translation for each locale that exists" do
      post translation_keys_path, valid_attributes
      
      @tk = TranslationKey.last
      @tk.translations.count.should == 2
    end
    
    it "should assign a value for the master locale and leave all others blank" do
      post translation_keys_path, valid_attributes

      Locale.last.translations.each do |trans|
        if trans.locale == @master_locale
          trans.value.should == valid_attributes['translation_key']['translation']['value']
        else
          trans.value.should == ""
        end
      end
    end
   
    it "should set the master translation field to true when it creates the master translation" do
      old_master_count = Translation.find_all_by_master(true).count
      post translation_keys_path, valid_attributes
      
      Translation.find_all_by_master(true).count.should == old_master_count + 1
    end
  end
end
