require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "#full_name creates the right full name" do
    # SET UP
    user = User.new(first_name: 'giSEla', last_name: 'kEiDeL')

    # EXERCISE
    full_name = user.full_name

    # VERIFY
    assert_equal full_name, "Gisela Keidel"
  end
  
  test "#full_name creates the right full name when we only have one the first name" do
    # SET UP
    user = User.new(first_name: 'leonardo')

    # EXERCISE
    full_name = user.full_name

    # VERIFY
    assert_equal full_name, "Leonardo"
  end
end
