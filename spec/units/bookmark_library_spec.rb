require 'bookmark_library'

describe Bookmark_Library do
  describe '.list_bookmarks' do
    it 'returns all bookmarks' do 
      connection = PG.connect(dbname: 'bookmark_manager_test')

      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com/');")
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.destroyallsoftware.com/');")
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.google.com/');")

      bookmarks = Bookmark_Library.list_bookmarks
      
      expect(bookmarks).to include('http://www.makersacademy.com/')
      expect(bookmarks).to include('http://www.destroyallsoftware.com/')
      expect(bookmarks).to include('http://www.google.com/')
    end
  end
end 