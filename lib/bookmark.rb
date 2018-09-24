require 'pg'

class Bookmark
  attr_reader :bookmarks
  def initialize
    @bookmarks = ['bookmark1','bookmark2']
  end

  def all
    conn = PG.connect :dbname => 'bookmark_manager'
    @rs = conn.exec("SELECT * FROM bookmarks").map{|x| x['url']}
  end
end
