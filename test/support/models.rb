# -*- encoding : utf-8 -*-
require "active_record"

ActiveRecord::Base.establish_connection(
  :adapter  => 'sqlite3',
  :database => File.join(File.dirname(__FILE__), 'test.db')
)

class CreateSchema < ActiveRecord::Migration
  def self.up
    create_table :customers, :force => true do |t|
      t.string :email
      t.boolean :admin, :default => false, :null => false
    end

    create_table :billing_addresses, :force => true do |t|
      t.string :street
      t.string :city
      t.string :zip_code
    end
  end
end

CreateSchema.suppress_messages { CreateSchema.migrate(:up) }

class Customer < ActiveRecord::Base
end

class BillingAddress < ActiveRecord::Base
end
