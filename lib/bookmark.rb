require 'pg'
require 'uri'

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
    connect.exec("SELECT id, url, title FROM bookmarks order by id").map{|x| { id: x['id'], url: x['url'], title: x['title']}}
  end

  def add_bookmark(url, title)
    connect.exec("insert into bookmarks (url, title) values ('#{url}', '#{title}');")
  end

  def delete_bookmark(id)
    connect.exec("delete from bookmarks where id = #{id.to_i};")
  end

  def update_bookmark(id, url, title)
    connect.exec("update bookmarks set url = '#{url}', title='#{title}' where id = #{id}")
  end

  def check_url(url)
    !!(url =~ URI::regexp)
  end

  def connect
    if ENV['ENVIRONMENT'] == 'test'
      return PG.connect(dbname: 'bookmark_manager_test')
    end
    return PG.connect(dbname: 'bookmark_manager')
  end
end
