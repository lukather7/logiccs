class NoticeMailer < ApplicationMailer
  default from: "logiccshosoya@gmail.com"

  
  def deliver_email(user, thread, post)
    @access_url = "https://" + ENV['MY_HOSTNAME'] + access_path + "?apid=" + thread.seed

    @user = user
    mail(:to => user.email, :subject => "Logipost Notice")
  end
  
  
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.sample_mailer.send_when_update.subject
  #

end
