class CreateTranslations < ActiveRecord::Migration
  def change
    create_table :translations do |t|
      t.string      :value
      t.boolean     :needs_update
      t.integer     :locale_id
      t.integer     :translation_key_id
      t.timestamps
    end
  end
end
