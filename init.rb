Redmine::Plugin.register :notifications do
  name 'Notifications plugin'
  author 'Mereth'
  description 'Provide an easy way for administrators to send notifications to all users.'
  version '1.0.0'
  
  menu :admin_menu, :notifications, { :controller => 'notifications', :action => 'index' }, :caption => :notifications
end
