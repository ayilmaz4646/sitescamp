# This migration comes from nimbos (originally 20151202122540)
class AddColorToNimbosTasks < ActiveRecord::Migration
  def change
  	change_table :nimbos_tasks do |t|
  		t.string    :color
  	end
  end
end
