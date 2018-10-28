class ApproveMailer < ApplicationMailer
  default from: "logiccshosoya@gmail.com"

  def test_email
    attachments['appove.pdf'] = {
      :content => File.read('sample.pdf', :mode => 'rb'),
      :transfer_encoding => :binary
    }
    
    mail(:to => "lukather7@gmail.com",
         :subject => "Approve  PDF")
  end
  
  def deliver_email(user, filepath)
    attachments['appove.pdf'] = {
      :content => File.read(filepath, :mode => 'rb'),
      :transfer_encoding => :binary
    }
    
    mail(:to => user.email, :subject => "Approve  PDF")
  end
  
  
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.sample_mailer.send_when_update.subject
  #

end
