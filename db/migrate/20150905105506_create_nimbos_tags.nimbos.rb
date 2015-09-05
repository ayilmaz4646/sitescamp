# This migration comes from nimbos (originally 20150817081242)
class CreateNimbosTags < ActiveRecord::Migration
  def change
    create_table :nimbos_tags do |t|
    	t.string 		 :name, index: true, null: false, limit: 50
    	t.string 		 :tag_type, limit: 50
    	t.references :patron, index: true, null: false

      t.timestamps null: false
    end

    add_index :nimbos_tags, [:name, :patron_id], unique: true
  end
end
