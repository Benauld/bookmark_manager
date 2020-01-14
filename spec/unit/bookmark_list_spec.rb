# frozen_string_literal: true

require 'bookmark_list'
require 'bookmark'

describe BookmarkList do
  let(:subject) { BookmarkList.new(Bookmark) }

  describe '#view_bookmarks' do
    it 'shows a list of the bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      connection.exec("INSERT INTO bookmarks(url) VALUES ( 'http://www.makersacademy.com');")
      connection.exec("INSERT INTO bookmarks(url) VALUES ( 'http://www.google.com');")
      connection.exec("INSERT INTO bookmarks(url) VALUES ( 'http://www.destroyallsoftware.com');")
      expect(subject.show_bookmarks.length).to eq(3)
      #expect(subject.show_bookmarks).to include 'http://www.makersacademy.com'
      #expect(subject.show_bookmarks).to include 'http://www.google.com'
      #expect(subject.show_bookmarks).to include 'http://www.destroyallsoftware.com'
    end
  end
end
