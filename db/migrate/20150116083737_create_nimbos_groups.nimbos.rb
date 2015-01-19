# This migration comes from nimbos (originally 20140306113023)
class CreateNimbosGroups < ActiveRecord::Migration
  def change
    create_table :nimbos_groups do |t|
      t.string   :title, limit: 255
      t.string   :grouped_type, limit: 100
      t.integer  :grouped_id
      t.boolean  :hidden, default: false
      t.integer  :admin_id, null: false
      t.integer  :patron_id, null: false

      t.timestamps
    end

    create_table(:nimbos_users_groups, :id => false) do |t|
      t.references :group
      t.references :user
    end

    add_index(:nimbos_groups, :title)
    add_index(:nimbos_groups, [ :grouped_type, :grouped_id ])
    add_index(:nimbos_users_groups, [ :group_id, :user_id ])
  end
end
