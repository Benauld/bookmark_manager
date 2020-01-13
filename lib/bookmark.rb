class Bookmark

  attr_reader :id, :url

  def initialize(id, url)
    @id = id
    @url = url
  end
end