# This migration comes from nimbos (originally 20160425152929)
class AddStatusToNimbosCounters < ActiveRecord::Migration
  def change
  	change_table :nimbos_counters do |t|
  		t.string   :status, limit: 30, default: "active"
  		t.string   :period_scope, limit: 10, default: "year"
  		t.string   :engine, limit: 30
  		t.integer  :active_year
  		t.integer  :active_month
  		t.integer  :count_str_length
  	end
  end
end
