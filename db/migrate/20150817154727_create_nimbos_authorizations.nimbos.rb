# This migration comes from nimbos (originally 20141212092101)
class CreateNimbosAuthorizations < ActiveRecord::Migration
  def change
    create_table   :nimbos_authorizations do |t|
      t.references :user, index: true, null: false
      t.string     :controller, null: false, limit: 50
      t.boolean    :can_manage, default: true
      t.boolean    :can_read, default: true
      t.boolean    :can_create, default: true
      t.boolean    :can_update, default: true
      t.boolean    :can_delete, default: true
      t.boolean    :can_list, default: true
      t.references :patron, index: true, null: false

      t.timestamps
    end
  end
end
