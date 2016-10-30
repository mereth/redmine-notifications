class Notification
  include ActiveModel::Validations
  
  attr_accessor :logged_since_option
  attr_accessor :subject
  attr_accessor :body
  attr_accessor :recipients
  
  validates_presence_of :recipients, :subject, :body
  
  def initialize(options = { })
    @recipients = []
    if options
      @subject = options[:subject]
      @body = options[:body]
      @logged_since_option = options[:logged_since_option]
    else
      @subject = ''
      @body = ''
      @logged_since_option = 'none'
    end
  end
  
  def deliver
    NotificationMailer.notification(self).deliver
  end
  
  def set_recipients_list()
    if @logged_since_option.to_sym == :all
      @recipients = User.find(:all, :conditions => ['status = ?', User::STATUS_ACTIVE])
    else
      case @logged_since_option.to_sym
        when :day
          logged_since = 1.day.ago
        when :week
          logged_since = 7.days.ago
        when :month
          logged_since = 1.month.ago
        when :year
          logged_since = 1.year.ago
      end
      
      if logged_since
        @recipients = User.find(:all, :conditions => ['last_login_on > (?) AND status = ?', logged_since, User::STATUS_ACTIVE])
      end
    end
  end

  def self.count_users_logged_since(logged_since_option)
    userscount = 0
    if logged_since_option.to_sym == :all
      userscount = User.count(:conditions => ['status = ?', User::STATUS_ACTIVE])
    else
      case logged_since_option.to_sym
        when :day
          logged_since = 1.day.ago
        when :week
          logged_since = 7.days.ago
        when :month
          logged_since = 1.month.ago
        when :year
          logged_since = 1.year.ago
      end
      
      if logged_since
        userscount = User.count(:conditions => ['last_login_on > (?) AND status = ?', logged_since, User::STATUS_ACTIVE])
      end
    end
    
    return userscount
  end
  
  def to_key
    [1]
  end
end
