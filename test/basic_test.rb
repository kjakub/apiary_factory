# -*- encoding : utf-8 -*-
require 'test/unit'

require File.expand_path(File.join(File.dirname(__FILE__), '../lib/apiary_girl'))
require File.expand_path(File.join(File.dirname(__FILE__), 'support/dictionaries'))
require File.expand_path(File.join(File.dirname(__FILE__), 'support/models'))

ApiaryGirl.create_definitions

class BasicTest < Test::Unit::TestCase

  def test_definitions_creation
    assert_equal 2, ApiaryGirl.definitions.size
    assert ApiaryGirl.definitions.include?(:customer)
    assert ApiaryGirl.definitions.include?(:billing_address)
    assert_equal Dictionaries::Customer, ApiaryGirl.definitions[:customer]
    assert_equal Dictionaries::BillingAddress, ApiaryGirl.definitions[:billing_address]
  end

  def test_building_factories_simple
    customer = ApiaryGirl.build(:customer, :member_attributes_not_saved)

    assert_equal "user@example.com", customer.email
    assert_equal true, customer.admin?
  end

  def test_building_factories_with_overrides
    customer = ApiaryGirl.build(:customer, :member_attributes_not_saved, :email => "test@example.com")

    assert_equal "test@example.com", customer.email
    assert_equal true, customer.admin?
  end

  def test_building_factories_collection
    customer = ApiaryGirl.create_collection(:customer, :member_attributes_not_saved, 3)

    # assert_equal "test@example.com", customer.email
    # assert_equal true, customer.admin?
  end

end
