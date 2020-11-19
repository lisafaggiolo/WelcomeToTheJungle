require 'rails_helper'
require 'database_cleaner'

def open_asset(file_name)
  File.open(Rails.root.join('db', 'seed_assets', file_name))
end 

RSpec.feature "ProductDetails", type: :feature do

  before :each do
    @category = Category.create! name: 'Apparel'
    
    1.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end

  end
  scenario "They see all products" do
    # ACT
    visit root_path
    
    #Add product to cart
    click_on "Add"

    # DEBUG / VERIFY
    save_screenshot

    # verify                  # that the cart count went up one
    expect(page).to have_text 'My Cart (1)', count: 1

  end
end
