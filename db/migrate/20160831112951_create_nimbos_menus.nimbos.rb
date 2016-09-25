# This migration comes from nimbos (originally 20151016125553)
class CreateNimbosMenus < ActiveRecord::Migration
  def change
    create_table   :nimbos_menus do |t|
      t.string     :label, limit: 50
      t.string     :i18n_code, limit: 255
      t.string     :icon, limit: 30
      t.string     :url, limit: 2000
      t.string     :app_model, limit: 50
      t.references :patron, index: true, null: false

      t.timestamps null: false
    end

    create_table(:nimbos_menu_users, :id => false) do |t|
      t.references :menu
      t.references :user
    end

    add_index(:nimbos_menu_users, [ :user_id, :menu_id ])
  end
end