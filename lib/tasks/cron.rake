desc "Send the beer rankings to users who want them"
task :cron => :environment do
  weekly_recipients = User.where(:notification_frequency => "weekly", :notify_on => Date.today.wday).map(&:email)
  monthly_recipients = User.where(:notification_frequency => "monthly", :notify_on => Date.today.mday).map(&:email)
  recipients = weekly_recipients + monthly_recipients

  unless recipients.empty?
    RankingNotificationMailer.notification(recipients).deliver
  end
end
