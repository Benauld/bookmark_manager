# frozen_string_literal: true

require 'pg'
require './lib/bookmark'

class BookmarkList
  def initialize(bookmark_class)
    @bookmark_class = bookmark_class
    @bookmarks = []
  end

  def show_bookmarks
    con = PG.connect(dbname: 'bookmark_manager')

    result = con.exec('SELECT * FROM bookmarks;')

    result.each do |bookmark|
      @bookmarks << @bookmark_class.new(bookmark['id'], bookmark['url'])
    end
    @bookmarks
  end
end
