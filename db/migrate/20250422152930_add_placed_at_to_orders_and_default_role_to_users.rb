class AddPlacedAtToOrdersAndDefaultRoleToUsers < ActiveRecord::Migration[8.0]
  def change
    # 1. marca a data de conclusão do checkout
    add_column :orders, :placed_at, :datetime
    add_index  :orders, [:user_id, :created_at]

    # 2. define default para o papel do usuário
    change_column_default :users, :role, from: nil, to: 0
  end
end