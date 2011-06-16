module CommentsHelper

  def get_user(comment)
#    @user = User.find(self.ticket_id)
#    @user = @user.email
    user = User.find(comment.user_id)
    user.email
  end
end
