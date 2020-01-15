# frozen_string_literal: true

require 'bookmark'

describe Bookmark do
  before(:all) do
    @connection = PG.connect(dbname: 'bookmark_manager_test')
  end

  describe '#self.all' do
    it 'shows a list of the bookmarks' do
      # Add the test data
      @connection.exec("INSERT INTO bookmarks VALUES(1, 'http://www.makersacademy.com', 'Makers');")
      @connection.exec("INSERT INTO bookmarks VALUES(2, 'http://www.destroyallsoftware.com', 'Destroy');")
      @connection.exec("INSERT INTO bookmarks VALUES(3, 'http://www.google.com', 'Google');")

      bookmarks = Bookmark.all

      expect(bookmarks[0].url).to include('http://www.makersacademy.com')
      expect(bookmarks[1].url).to include('http://www.destroyallsoftware.com')
      expect(bookmarks[2].url).to include('http://www.google.com')
    end
  end
  describe '.create' do
    it 'creates a new bookmark' do
      bookmark = Bookmark.create(url: 'http://www.testbookmark.com', title: 'Test Bookmark')
      persisted_data = @connection.query("SELECT * FROM bookmarks WHERE id = #{bookmark.id};")

      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data.first['id']
      expect(bookmark.title).to eq 'Test Bookmark'
      expect(bookmark.url).to eq 'http://www.testbookmark.com'
    end
  end
  describe '.delete' do
    it 'deletes the given bookmark' do
      bookmark = Bookmark.create(url: 'http://www.testbookmark.com', title: 'Test Bookmark')
      Bookmark.delete(id: bookmark.id)

      expect(Bookmark.all.length).to eq 0
    end
  end
end
