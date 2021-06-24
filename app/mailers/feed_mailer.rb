class FeedMailer < ApplicationMailer
  def feed_mail(feed)
    @feed = feed
    mail to: feed.email, subject: "お問い合わせの確認メール"
  end
end

# feed.user.email