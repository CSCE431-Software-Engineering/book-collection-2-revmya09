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

RSpec.describe 'creating a book and checking database', type: :request do
    describe 'POST /books' do
        it 'creates a book with author, published date, and price' do
          post '/books', params: { book: { title: "harry potter", author: "j.k. rowling", published_date: "2007-07-21", price: 10.99, publisher: "scholastic", pages: 309, release_date: "2007-07-22" } }
          expect(response).to have_http_status(:found)
          follow_redirect!
          expect(response).to have_http_status(:ok)
          expect(Book.last.title).to eq("harry potter")
          expect(Book.last.author).to eq("j.k. rowling")
          expect(Book.last.published_date).to eq(Date.new(2007, 7, 21))
          expect(Book.last.price).to eq(10.99)
          expect(Book.last.publisher).to eq("scholastic")
          expect(Book.last.pages).to eq(309)
          expect(Book.last.release_date).to eq(Date.new(2007, 7, 22))
        end
    end
end
