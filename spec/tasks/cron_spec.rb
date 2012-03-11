require 'spec_helper'
require 'rake'

describe "cron task" do
  before(:each) do
    @rake = Rake::Application.new
    Rake.application = @rake
    Rake::Task.define_task(:environment)
    load File.join(Rails.root, 'lib/tasks/cron.rake')

    @b1 = given_a_beer("Convict Hill")
    @b2 = given_a_beer("Coors Lite")
    @b3 = given_a_beer("Strong Bow")
  end

  describe "emails weekly notifications" do
    before(:each) do
      given_a_user('alice',
        :notification_frequency => 'weekly',
        :notify_on => Date.today.wday
      ).update_attribute(
        :votes, [@b1, @b3, @b2]
      )
      given_a_user('bob',
        :notification_frequency => 'weekly',
        :notify_on => Date.today.wday+1
      ).update_attribute(
        :votes, [@b1, @b3, @b2]
      )
      given_a_user('clarice',
        :notification_frequency => 'monthly',
        :notify_on => Date.today.mday
      ).update_attribute(
        :votes, [@b1, @b3, @b2]
      )
      given_a_user('david',
        :notification_frequency => 'monthly',
        :notify_on => Date.today.mday+1
      ).update_attribute(
        :votes, [@b1, @b3, @b2]
      )
      given_a_user('eric',
        :notification_frequency => 'never'
      ).update_attribute(
        :votes, [@b1, @b3, @b2]
      )
    end

    it "sends an email if today is the notify_on day" do
      lambda { Rake::Task['cron'].invoke }.should change(ActionMailer::Base.deliveries, :size).by(1)
      mail = ActionMailer::Base.deliveries.first


      mail.to.should include('alice@gmail.com')
      mail.to.should include('clarice@gmail.com')
      mail.to.should_not include('bob@gmail.com')
      mail.to.should_not include('david@gmail.com')
      mail.to.should_not include('eric@gmail.com')
      mail.subject.should match(/Time for a Beer Run!/)
      mail.body.should match(/Here are the current rankings/)
      mail.body.to_s.should have_tag("ol") do
        with_tag 'li:nth-child(1)', :text => 'Convict Hill'
        with_tag 'li:nth-child(2)', :text => 'Strong Bow'
        with_tag 'li:nth-child(3)', :text => 'Coors Lite'
      end
    end
  end
end
