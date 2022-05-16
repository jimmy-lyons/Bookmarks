require 'pg'
require_relative './database_connection'
require 'uri'

class Bookmarks
  
  attr_reader :id, :title, :url

  def initialize(id:, title:, url:)
    @id = id
    @title = title
    @url = url
  end

  def self.list_bookmarks
    result = DatabaseConnection.query("SELECT * FROM bookmarks", [])
    result.map do |bookmark|
      Bookmarks.new(id: bookmark['id'], title: bookmark['title'], url: bookmark['url'])
    end 
  end

  def self.create(url:, title:)
    return false unless is_url?(url)
    result = DatabaseConnection.query("INSERT INTO bookmarks (url, title) VALUES($1, $2) RETURNING id, title, url;", [url, title])
    Bookmarks.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end

  def self.delete(id:)
    DatabaseConnection.query("DELETE FROM bookmarks WHERE id = $1", [id])
  end

  def self.edit(id:, title:, url:)
    result = DatabaseConnection.query(
      "UPDATE bookmarks SET url = $1, title = $2 where id = $3 RETURNING id, url, title",
      [url, title, id]
    )
    Bookmarks.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end

  def self.find(id:)
    result = DatabaseConnection.query("SELECT * FROM bookmarks WHERE id = $1", [id])
    Bookmarks.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end

  def comments(comment_class = Comment)
    comment_class.where(bookmark_id: id)
  end

private

def self.is_url?(url)
  url =~ /\A#{URI::regexp(['http', 'https'])}\z/
end

end
