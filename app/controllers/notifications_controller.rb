class NotificationsController < ApplicationController
  def index
    @notifications = current_user.notifications.order(created_at: :desc)
  end

  def read
    notification = current_user.notifications.find(params[:id])
    unless notification.read?
      notification.update(read: true)
    end
    redirect_to notification.notifiable.appropiate_path
  end
end
