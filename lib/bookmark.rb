require 'pg'

class Bookmark
  attr_reader :bookmarks

  def initialize
  end

  def self.create
    @@bookmark = Bookmark.new
  end

  def self.instance
    @@bookmark
  end

  def all
    connect.exec("SELECT * FROM bookmarks").map{|x| { id: x['id'], url: x['url']}}
  end

  def add_bookmark(url)
    connect.exec("insert into bookmarks (url) values ('#{url}');")
  end

  def delete_bookmark(id)
    connect.exec("delete from bookmarks where id = #{id.to_i};")
  end

  def connect
    if ENV['ENVIRONMENT'] == 'test'
      return PG.connect(dbname: 'bookmark_manager_test')
    end
    return PG.connect(dbname: 'bookmark_manager')
  end
end
