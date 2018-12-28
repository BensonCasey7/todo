class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.text :content
      t.belongs_to :list, index: true

      t.timestamps
    end
  end
end
