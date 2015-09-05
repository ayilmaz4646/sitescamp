# This migration comes from nimbos (originally 20150819080829)
class NimbosGroupContacts < ActiveRecord::Migration
  create_table :nimbos_group_contacts do |t|
  	t.references :group
  	t.references :contact
  end
end
