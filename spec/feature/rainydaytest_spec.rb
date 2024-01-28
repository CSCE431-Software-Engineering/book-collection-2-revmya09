# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a book with blank fields', type: :feature do
    scenario 'valid inputs' do
        visit new_book_path
        click_on 'Create Book'
        expect(page).to have_content("Title can't be blank")
        expect(page).to have_content("Author can't be blank")
        expect(page).to have_content("Price can't be blank")
        expect(page).to have_content("Price is not a number")
        expect(page).to have_content("Published date can't be blank")
        expect(page).to have_content("Publisher can't be blank")
        expect(page).to have_content("Pages can't be blank")
        expect(page).to have_content("Pages is not a number")
        expect(page).to have_content("Release date can't be blank")
    end
end

RSpec.describe 'Creating a book with invalid input for number fields', type: :feature do
    scenario 'invalid inputs' do
      visit new_book_path
      fill_in "book[title]", with: 'harry potter'
      fill_in "book[author]", with: 'j.k. rowling'
      fill_in "book[price]", with: 'ten'
      fill_in "book[published_date]", with: '2007-07-21'
      fill_in "book[publisher]", with: 'scholastic'
      fill_in "book[pages]", with: 'three hundred'
      fill_in "book[release_date]", with: '2007-07-22'
      click_on 'Create Book'
      expect(page).to have_content("Price is not a number")
      expect(page).to have_content("Pages is not a number")
    end
end