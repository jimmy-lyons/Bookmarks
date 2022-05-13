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
      # persisted_data = PG.connect(dbname: 'bookmark_manager_test').query("SELECT * FROM bookmarks WHERE id = #{bookmark.id};")

      expect(bookmark).to be_a Bookmarks
      # expect(bookmark.id).to eq persisted_data['id']
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
end 
