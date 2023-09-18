class NotificationsController < ApplicationController
  def index
    @notifications = current_user.notifications.order(created_at: :desc)
  end

  def read
    notification = current_user.notifications.find(params[:id])
    notification.update(read: true) unless notification.read?
    redirect_to notification.notifiable.appropiate_path
  end
end
