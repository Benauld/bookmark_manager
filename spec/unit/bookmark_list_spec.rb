require 'bookmark_list'
require 'bookmark'

describe BookmarkList do
  let(:subject){BookmarkList.new(Bookmark)}

  describe "#view_bookmarks" do
    it "shows a list of the bookmarks" do
      expect(subject.show_bookmarks).to be_a_kind_of Array
    end
  end
end