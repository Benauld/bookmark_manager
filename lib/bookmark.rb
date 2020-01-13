# frozen_string_literal: true

class Bookmark
  attr_reader :id, :url

  def initialize(id, url)
    @id = id
    @url = url
  end

  def print
    @id.to_s + ' ' + @url.to_s
  end
end
