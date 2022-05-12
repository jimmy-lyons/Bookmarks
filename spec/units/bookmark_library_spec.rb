require 'bookmark_library'

describe Bookmark_Library do
  describe '.list_bookmarks' do
    it 'returns all bookmarks' do 

      Bookmark_Library.create(url: 'http://www.makersacademy.com/', title: 'Makers Academy')
      Bookmark_Library.create(url: 'http://www.destroyallsoftware.com/', title: 'Destroy All Software')
      Bookmark_Library.create(url: 'http://www.google.com/', title: 'Google')

      bookmarks = Bookmark_Library.list_bookmarks
      
      expect(bookmarks).to include({"Makers Academy" => "http://www.makersacademy.com/"})
      expect(bookmarks).to include({"Destroy All Software" => "http://www.destroyallsoftware.com/"})
      expect(bookmarks).to include({"Google" => "http://www.google.com/"})
    end
  end

  describe '.create' do
    it 'creates a new bookmark' do
      Bookmark_Library.create(url: 'http://www.example.org', title: 'example')
      expect(Bookmark_Library.list_bookmarks).to include {"Example" => 'http://www.example.org'}
    end
  end
end 