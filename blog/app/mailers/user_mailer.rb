class UserMailer < ApplicationMailer
	default from: 'no_reply@concrastinator.com'

	def Notification_email(user)
		@user = user
		@url = 'http://google.com/'
		mail(to: @user.email, subject: 'You faggot')
	end

end
