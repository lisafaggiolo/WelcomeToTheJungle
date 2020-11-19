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

    click_on "Details"

    # DEBUG / VERIFY
    save_screenshot

    # verify                  # that matches a css class in the individual product
    expect(page).to have_css 'article.product', count: 1

  end
end
