class CreateTranslations < ActiveRecord::Migration
  def change
    create_table :translations do |t|
      t.string      :value
      t.boolean     :needs_update
      t.decimal     :locale_id
      t.decimal     :translation_key_id
      t.timestamps
    end
  end
end
