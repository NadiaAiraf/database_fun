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
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    connection.exec("SELECT * FROM bookmarks").map{|x| x['url']}
  end
end
