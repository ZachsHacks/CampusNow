class Rsvp < ApplicationRecord
	belongs_to :user
	belongs_to :event
	validates :user_id, :uniqueness => { :scope => :event_id}

debugger
	@@REMINDER_TIME = 15.minutes # minutes before appointment

 # Notify our appointment attendee X minutes before the appointment time
 def reminder
	 @test_time =  Time.new(2017,4, 14, 16, 15, 2)
	 @twilio_number = ENV['TWILLIO_NUMBER']
	 @client = Twilio::REST::Client.new ENV['TWILLIO_ACCOUNT'], ENV['TWILLIO_SECRET']
	 time_str = ((@test_time).localtime).strftime("%I:%M%p on %b. %d, %Y")
	 reminder = "Hi Aaron. Just a reminder that you have an appointment coming up at."
	 message = @client.account.messages.create(
		 :from => @twilio_number,
		 :to => '2155958832',
		 :body => reminder,
	 )
	 puts message.to
 end

 def when_to_run
	 time - @@REMINDER_TIME
 end

 handle_asynchronously :reminder, :run_at => Proc.new { |i| i.when_to_run }

end
