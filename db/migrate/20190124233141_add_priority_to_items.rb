class AddPriorityToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :priority, :string
  end
end
