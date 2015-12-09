namespace :mail do
	desc 'prueba'
	task prueba: :environment do
	  # ... set options if any
	  TimeNow = Time.now.to_formatted_s(:db)
	  for U in User.all() do
	  	for T in U.tasks.all() do
	  		if T.due_date.to_formatted_s(:db) > TimeNow && (TimeNow-T.due_date.to_formatted_s(:db))<1.hour
	  			UserMailer.notification_email(U, T).deliver_now
	  		end
	  	end
	  end
	  #UserMailer.prueba().deliver_now
	  #puts 'I am a simple task'
	end
end
