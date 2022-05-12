require 'pg'

class Bookmark_Library
  
  # Maybe this needs to be split into list titles and list urls
  def self.list_bookmarks
    connection = select_database
    result = connection.exec("SELECT * FROM bookmarks")
    result.map { |bookmark| { bookmark['title'] => bookmark['url'] } }
  end

  def self.create(url:, title:)
    connection = select_database
    connection.exec("INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}')")
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
