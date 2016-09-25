# This migration comes from nimbos (originally 20160225085843)
class AddJobtitleToNimbosUsers < ActiveRecord::Migration
  def change
  	change_table  :nimbos_users do |t|
  		t.string    :jobtitle
  		t.date      :menu_config_date
  	end
  end
end
