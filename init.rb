Redmine::Plugin.register :notifications do
  name 'Notifications plugin'
  author 'mereth'
  author_url 'https://github.com/mereth'
  url 'https://github.com/mereth/redmine-notifications'
  description 'Provide an easy way for administrators to send email notifications to all users.'
  version '1.1.0'
  
  menu :admin_menu, :notifications, { :controller => 'notifications', :action => 'index' }, :caption => :notifications
end
