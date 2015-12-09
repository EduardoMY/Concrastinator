class UserMailer < ApplicationMailer
	default from: 'no_reply@concrastinator.com'

	def notification_email(user, task)
		@user = user
		@task = task
		mail(to: @user.email, subject: 'You have a task that expires soon')
	end

	def new_email(user)
		@user =user
		mail(to: @user.email, subject: 'Hi '+user.name+', thanks for joinning the Concrastinators community!')
	end

	def new_task_email(user, task)
		@user=user
		@task=task
		mail(to: @user.email, subject: 'You have just created a new task!')
	end
	
	def prueba()
		mail(to: 'isai.ayala@cetys.edu.mx', subject: 'You faggot');
	end
end
