# This migration comes from nimbos (originally 20160225085710)
class CreateNimbosUsersPatrons < ActiveRecord::Migration
  def change
    create_table   :nimbos_users_patrons do |t|
    	t.references :user
    	t.references :patron

    	t.timestamps
    end
  end
end
