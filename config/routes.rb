# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html
match 'admin/notifications', :to => 'notifications#index', :via => [:get, :post]
post 'admin/notifications/preview', :to => 'notifications#preview', :as => 'preview_notification'
get 'admin/notifications/numberofrecipients', :to => 'notifications#number_of_recipients', :as => 'notification_numberofrecipients'