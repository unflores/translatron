class CreateTranslationKeys < ActiveRecord::Migration
  def change
    create_table :translation_keys do |t|
      t.string :scope
      t.string :tkey

      t.timestamps
    end
  end
end
