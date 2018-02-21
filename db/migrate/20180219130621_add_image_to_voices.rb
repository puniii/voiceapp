class AddImageToVoices < ActiveRecord::Migration[5.1]
  def change
    add_column :voices, :image, :text
  end
end
