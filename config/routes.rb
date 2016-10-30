# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html
match 'admin/notifications', :to => 'notifications#index'
match 'admin/notifications/preview', :to => 'notifications#preview', :as => 'preview_notification'
match 'admin/notifications/numberofrecipients', :to => 'notifications#number_of_recipients', :as => 'notification_numberofrecipients'