require 'bookmark'

describe Bookmark do
  describe '#all' do
    it 'returns a list of all of the bookmarks' do
      expect(subject.all).to eq "bookmark1, bookmark2"
    end
  end
end
