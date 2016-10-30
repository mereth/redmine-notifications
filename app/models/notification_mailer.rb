class NotificationMailer < Mailer
  def notification(notification)
    @body = notification.body
    mail :to => notification.recipients.collect(&:mail), :subject => notification.subject
  end
end
