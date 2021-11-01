class CreateDocuments < ActiveRecord::Migration[6.0]
  def change
    create_table :documents do |t|
      t.string :attachment
      t.string :description
      t.string :uploader

      t.timestamps
    end
  end
end
