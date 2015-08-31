# This migration comes from nimbos (originally 20150319071625)
class AddAppnameToNimbosPatrons < ActiveRecord::Migration
  def change
    add_column :nimbos_patrons, :appname, :string, limit: 30
  end
end
