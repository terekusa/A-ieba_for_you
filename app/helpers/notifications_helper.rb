module NotificationsHelper
  def transition_path(notification)
    case notification.action_type.to_sym
    when :commented_to_own_post
      post_path(notification.notifiable.post, anchor: "comment-#{notification.notifiable.id}")
    when :liked_to_own_post
      post_path(notification.notifiable.post)
    end
  end
end
