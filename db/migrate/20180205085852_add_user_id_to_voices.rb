class AddUserIdToVoices < ActiveRecord::Migration[5.1]
  def change
    add_column :voices, :user_id, :string
  end
end
