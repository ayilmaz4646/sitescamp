# This migration comes from nimbos (originally 20151107085609)
class AddCreditLimitToNimbosPatrons < ActiveRecord::Migration
  def change
  	change_table :nimbos_patrons do |t|
  		t.decimal  :credit_limit, default: 0
  		t.string   :tax_no, limit: 30
  		t.string   :tax_office, limit: 100
  	end
  end
end
