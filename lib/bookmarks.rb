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
    result = connection.exec_params("INSERT INTO bookmarks (url, title) VALUES($1, $2) RETURNING id, title, url;", [url, title])
    Bookmarks.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end

  def self.delete(id:)
    connection = select_database
    connection.exec_params("DELETE FROM bookmarks WHERE id = $1", [id])
  end

  def self.edit(id:, title:, url:)
    connection = select_database
    result = connection.exec_params(
      "UPDATE bookmarks SET url = $1, title = $2 where id = $3 RETURNING id, url, title",
      [url, title, id]
    )
    Bookmarks.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
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
