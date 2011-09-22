require 'spec_helper'

describe "Locales" do
  describe "POST /locales" do

    def valid_attributes
      { "locale" => { "code" => "es", "name" => "Spanish", "master"=>"0" } }
    end
    
    before(:each) do
      @master_locale  = Factory :master_locale
      5.times{ Factory :translation_key }
    end
    
    it "creates a blank translation with the current local for each translation key there is" do
      starting_count = Translation.count

      post locales_path, valid_attributes
      (starting_count + 5).should == Translation.count
    end
    
    
  end
end