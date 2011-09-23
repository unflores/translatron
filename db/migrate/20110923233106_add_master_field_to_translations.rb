class AddMasterFieldToTranslations < ActiveRecord::Migration
  def change
    add_column :translations, :master, :boolean
  end
end
