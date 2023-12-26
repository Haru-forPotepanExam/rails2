class AddAvatarDeleteToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :avatar_delete, :boolean
  end
end
