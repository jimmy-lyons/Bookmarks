require 'pg'

class Bookmarks
  
  attr_reader :id, :title, :url

  def initialize(id:, title:, url:)
    @id = id
    @title = title
    @url = url
  end

  def self.list_bookmarks
    connection = select_database
    result = connection.exec("SELECT * FROM bookmarks")
    result.map do |bookmark|
      Bookmarks.new(id: bookmark['id'], title: bookmark['title'], url: bookmark['url'])
    end 
  end

  def self.create(url:, title:)
    connection = select_database
    # this doesn't protect SQL injection but is meant to. Don't know how to fix...
    result = connection.exec_params("INSERT INTO bookmarks (url, title) VALUES($1, $2) RETURNING id, title, url;", [url, title])
                                   #("INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}') RETURNING id, title, url")
    Bookmarks.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end

  def self.delete(id:)
    connection = select_database
    connection.exec_params("DELETE FROM bookmarks WHERE id = $1", [id])
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
