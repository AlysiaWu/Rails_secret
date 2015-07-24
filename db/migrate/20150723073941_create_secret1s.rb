class CreateSecret1s < ActiveRecord::Migration
  def change
    create_table :secret1s do |t|
      t.text :content
      t.references :user, index: true

      t.timestamps
    end
  end
end
