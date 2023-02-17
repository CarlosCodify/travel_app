# frozen_string_literal: true

require 'test_helper'
require 'faker'

class CustomerTest < ActiveSupport::TestCase
  test 'Create customer' do
    customer = Customer.new
    customer.person = Person.new
    customer.person.name = Faker::Name.name
    customer.person.last_name = Faker::Name.last_name
    customer.person.identity_document = Faker::Number.number(digits: 7)
    customer.person.status = Faker::Boolean.boolean
    customer.person.birthday = Faker::Date.birthday(min_age: 18, max_age: 65)
    assert customer.save
  end
end
