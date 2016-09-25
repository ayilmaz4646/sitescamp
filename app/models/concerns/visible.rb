module Visible
  extend ActiveSupport::Concern

  module ClassMethods
    def visible_to(user)
      where("#{table_name}.patron_id = ?", user.patron_id)
    end
  end
end