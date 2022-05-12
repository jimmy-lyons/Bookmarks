require 'pg'

class Bookmark_Library
  
  def self.list_bookmarks
    connection = select_database
    result = connection.exec("SELECT * FROM bookmarks")
    result.map { |bookmark| bookmark['url'] }
  end

  def self.create(url:)
    connection = select_database
    connection.exec("INSERT INTO bookmarks (url) VALUES('#{url}')")
  end

  private

  def self.select_database
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else  
      connection = PG.connect(dbname: 'bookmark_manager')
    end
  end

end
