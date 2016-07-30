class Post

  attr_reader :points, :comments, :title, :points, :url

  def initialize(title,url,points,item_id)
    @title = title
    @url = url
    @points = points
    @item_id = item_id
    @comments = []
  end

  def comments
    @comments
  end

  def add_comment(comment)
    @comments << comment
  end

  def num_comments
    @comments.length
  end
end