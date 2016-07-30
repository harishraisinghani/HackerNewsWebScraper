class Comment

  attr_reader :user_id, :age, :comment_id, :comment

  def initialize(user_id,age,comment_id,comment)
    @user_id = user_id
    @age = age
    @comment_id = comment_id
    @comment = comment
  end
end
