require 'bookmark_list'

describe BookmarkList do
  let(:bookmarks){["google", "facebook", "Twitter"]}

  describe "#view_bookmarks" do
    it "shows a list of the bookmarks" do
      expect(subject.show_bookmarks).to eq bookmarks
    end
  end
end