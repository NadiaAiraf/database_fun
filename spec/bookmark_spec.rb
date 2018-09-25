require 'bookmark'
require 'pg'


describe Bookmark do
  describe '#all' do
    it 'returns a list of all of the bookmarks' do
      subject.all
      expect(subject.all).to eq [{:id=>"1", :url=>"aidan"},
                                 {:id=>"2", :url=>"tom"},
                                 {:id=>"3", :url=>"makers"},
                                 {:id=>"4", :url=>"academy"}]
    end
  end

  describe '#delete_bookmark' do
    it 'deletes a bookmark we want deleted' do
      subject.delete_bookmark('1')
      expect(subject.all).to eq [{:id=>"2", :url=>"tom"},
                                 {:id=>"3", :url=>"makers"},
                                 {:id=>"4", :url=>"academy"}]
    end
  end
end
