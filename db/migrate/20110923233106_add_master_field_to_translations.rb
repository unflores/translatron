class AddMasterFieldToTranslations < ActiveRecord::Migration
  def change
    add_column :translations, :master_translation_id, :integer
  end
end
