class RemoveOptionAttributes < ActiveRecord::Migration[5.1]
  def change
    remove_column :choices, :option_a, :string
    remove_column :choices, :option_b, :string
    remove_column :choices, :option_c, :string
    remove_column :choices, :option_d, :string
    add_column :choices, :option, :string
  end
end
