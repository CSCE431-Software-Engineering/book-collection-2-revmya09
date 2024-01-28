# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a book', type: :feature do
  scenario 'valid inputs' do
    visit new_book_path
    fill_in "book[title]", with: 'harry potter'
    fill_in "book[author]", with: 'j.k. rowling'
    fill_in "book[price]", with: '10.99'
    fill_in "book[published_date]", with: '2007-07-21'
    fill_in "book[publisher]", with: 'scholastic'
    fill_in "book[pages]", with: '309'
    fill_in "book[release_date]", with: '2007-07-22'
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('harry potter')
    expect(page).to have_content('j.k. rowling')
    expect(page).to have_content('10.99')
    expect(page).to have_content('2007-07-21')
    expect(page).to have_content('scholastic')
    expect(page).to have_content('309')
    expect(page).to have_content('2007-07-22')
  end
end