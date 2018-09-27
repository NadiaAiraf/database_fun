require 'bookmark'
require 'pg'


describe Bookmark do
  describe '#all' do
    it 'returns a list of all of the bookmarks' do
      subject.all
      expect(subject.all).to eq [{:id=>"1", :url=>"http://google.com",:title=>"google"},
       {:id=>"2", :url=>"http://facebook.com",:title=>"facebook"},
       {:id=>"3", :url=>"http://twitter.com",:title=>"twitter"},
       {:id=>"4", :url=>"http://youtube.com",:title=>"youtube"}]
    end
  end

  describe '#delete_bookmark' do
    it 'deletes a bookmark we want deleted' do
      subject.delete_bookmark('1')
      expect(subject.all).to eq [{:id=>"2", :url=>"http://facebook.com",:title=>"facebook"},
                                  {:id=>"3", :url=>"http://twitter.com",:title=>"twitter"},
                                  {:id=>"4", :url=>"http://youtube.com",:title=>"youtube"}]
    end
  end
end
