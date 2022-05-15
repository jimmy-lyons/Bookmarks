require 'bookmarks'
require 'pg'

describe Bookmarks do
  describe '.list_bookmarks' do
    it 'returns all bookmarks' do 

      bookmark = Bookmarks.create(url: 'http://www.makersacademy.com/', title: 'Makers Academy')
      Bookmarks.create(url: 'http://www.destroyallsoftware.com/', title: 'Destroy All Software')
      Bookmarks.create(url: 'http://www.google.com/', title: 'Google')

      bookmarks = Bookmarks.list_bookmarks
      
      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmarks
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq 'Makers Academy'
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com/'
    end
  end

  describe '.create' do
    it 'creates a new bookmark' do
      bookmark = Bookmarks.create(url: 'http://www.example.org', title: 'example')

      expect(bookmark).to be_a Bookmarks
      expect(bookmark.title).to eq 'example'
      expect(bookmark.url).to eq 'http://www.example.org'
    end
  end

  describe '.delete' do
    it 'deletes a given bookmark' do
      bookmark = Bookmarks.create(title: 'Makers Academy', url: 'http://www.makersacademy.com')

      Bookmarks.delete(id: bookmark.id)

      expect(Bookmarks.list_bookmarks.length).to eq 0
    end
  end

  describe '.edit' do
    it 'updates the values of a given bookmark' do
      bookmark = Bookmarks.create(title: 'Makers Academy', url: 'http://www.makersacademy.com')
      updated_bookmark = Bookmarks.edit(id: bookmark.id, title: 'Yahoo', url: 'http://www.yahoo.com')

      expect(updated_bookmark).to be_a Bookmarks
      expect(updated_bookmark.id).to eq bookmark.id
      expect(updated_bookmark.title).to eq 'Yahoo'
      expect(updated_bookmark.url).to eq 'http://www.yahoo.com'
      expect(Bookmarks.list_bookmarks.length).to eq 1
    end
  end

  describe '.find' do
    it 'returns a specific bookmark object' do
      bookmark = Bookmarks.create(title: 'Yahoo', url: 'http://www.yahoo.com')
      result = Bookmarks.find(id: bookmark.id)

      expect(bookmark).to be_a Bookmarks
      expect(bookmark.id).to eq bookmark.id
      expect(bookmark.title).to eq 'Yahoo'
      expect(bookmark.url).to eq 'http://www.yahoo.com'
    end
  end
end 
