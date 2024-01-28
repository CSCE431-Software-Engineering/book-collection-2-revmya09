# location: spec/unit/unit_spec.rb
require 'rails_helper'

RSpec.describe Book, type: :model do
  subject do
    described_class.new(
        title: 'harry potter',
        author: 'j.k. rowling',
        price: 10.99,
        published_date: Date.parse('2007-07-21'),
        publisher: 'scholastic',
        pages: 309,
        release_date: Date.parse('2007-07-22'),
    )
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a title' do
    subject.title = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without an author' do
    subject.author = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a price' do
    subject.price = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a published_date' do
    subject.published_date = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a publisher' do
    subject.publisher = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without pages' do
    subject.pages = nil
    expect(subject).not_to be_valid
  end

  it 'is not valid without a release_date' do
    subject.release_date = nil
    expect(subject).not_to be_valid
  end
end