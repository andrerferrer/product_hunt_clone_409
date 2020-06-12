require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  test "visiting the index shows me the correct H1 and the correct number of product cards" do
    # EXERCISE
    visit root_path
    # VERIFY
    assert_selector "h1", text: "Awesome Products"

    assert_selector ".card-product", count: Product.count
  end

  test "lets a signed in user create a new product" do
    # SET UP
    previous_product_count = Product.count
    # log in
    player_one = users(:player_one)
    login_as player_one

    # EXERCISE
    # go to the new product page
    visit new_product_path
    # fill in the form
    fill_in 'product_name', with: 'Freeco'
    fill_in 'product_tagline', with: 'You poop is now free'
    # click on the button
    click_on 'Create Product'
    # VERIFY
    # check if something was created
    assert_not_equal Product.count, previous_product_count
    # check if we are on the product show page
    assert_equal page.current_path, product_path(Product.last)
    # check if in this page we have an h2 with the name of the product
    assert_selector "h2", text: Product.last.name

  end
end
