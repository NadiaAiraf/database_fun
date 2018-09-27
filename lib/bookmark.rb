require 'pg'
require 'uri'
require_relative 'database_connection'

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
    connect.query("SELECT id, url, title FROM bookmarks order by id").map{|x| { id: x['id'], url: x['url'], title: x['title']}}
  end

  def add_bookmark(url, title)
    connect.query("insert into bookmarks (url, title) values ('#{url}', '#{title}');")
  end

  def delete_bookmark(id)
    connect.query("delete from bookmarks where id = #{id.to_i};")
  end

  def update_bookmark(id, url, title)
    connect.query("update bookmarks set url = '#{url}', title='#{title}' where id = #{id}")
  end

  def check_url(url)
    !!(url =~ URI::regexp)
  end

  def add_comment(text,id)
    connect.query("insert into comments (text, bookmark_id) values('#{text}',#{id})")
  end

  def connect
    if ENV['ENVIRONMENT'] == 'test'
      DatabaseConnection.setup('bookmark_manager_test')
    else
      DatabaseConnection.setup('bookmark_manager')
    end
  end
end
