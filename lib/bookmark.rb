class Bookmark
  attr_reader :bookmarks
  def initialize
    @bookmarks = ['bookmark1','bookmark2']
  end

  def all
    bookmarks.join(", ")
  end
end
