require 'bookmark_list'

describe BookmarkList do
  let(:subject){BookmarkList.new(Bookmark)}

  describe "#view_bookmarks" do
    it "shows a list of the bookmarks" do
      expect(subject.show_bookmarks).to include 'http://www.google.com'
    end
  end
end