# This migration comes from nimbos (originally 20150817083006)
class CreateNimbosTaggings < ActiveRecord::Migration
  def change
    create_table :nimbos_taggings do |t|
      t.references 	:tag, index: true, null: false
      t.references  :parent, polymorphic: true, index: true, null: false
    	t.references  :patron, index: true, null: false

      t.timestamps null: false
    end

    add_index :nimbos_taggings, [:tag_id, :parent_type, :parent_id, :patron_id], name: "nimbos_taggings_unique_tag", unique: true
  end
end
