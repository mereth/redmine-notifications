class NotificationsController < ApplicationController
  unloadable
  before_filter :require_admin

  @@logged_since_options = [[l(:text_none),'none'],
                          [l(:text_24_hours),'day'],
                          [l(:text_1_week),'week'],
                          [l(:text_1_month),'month'],
                          [l(:text_1_year),'year'],
                          [l(:text_all_time),'all']]

  def index 
    @logged_since_options = @@logged_since_options
    @notification = Notification.new(params[:notification])
    @count_logged_users = Notification.count_users_logged_since(@notification.logged_since_option)
    
    if request.post?
      @notification.set_recipients_list()
      
      if @notification.valid?
        if @notification.deliver
          flash[:notice] = "System Notification was successfully sent."
        else
          flash[:error] = "System Notification was not sent."
        end
      end
    end
  end

  def number_of_recipients
    @count_logged_users = Notification.count_users_logged_since(params[:logged_since_option])
    respond_to do |format|
      format.html { render :partial => 'number_of_recipients', :object => @count_logged_users }
    end
  end

  def preview
    @text = params[:notification][:body]
    render :partial => 'common/preview'
  end
end
