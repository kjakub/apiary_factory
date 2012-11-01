# -*- encoding : utf-8 -*-
module Dictionaries
  module Customer
    def self.member_attributes_not_saved
      {
        :email => "user@example.com",
        :admin => "true",
      }
    end
  end
end

module Dictionaries
  module BillingAddress
    def self.member_attributes_not_saved
      {
        :street => "245 Avenue",
        :city => "London",
        :zip_code => "123 45",
      }
    end
  end
end
