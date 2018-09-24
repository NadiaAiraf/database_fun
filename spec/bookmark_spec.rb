require 'bookmark'
require 'pg'


describe Bookmark do
  describe '#all' do
    it 'returns a list of all of the bookmarks' do
      subject.all
      expect(subject.all).to eq ["http://www.google.com", "http://www.twitter.com", "hello", "hello"]
    end
  end
end
