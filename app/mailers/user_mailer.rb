class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def password_reset(user)
    @user = usermail :to => @user.email, :subject => "Reset your password"
  end
end
