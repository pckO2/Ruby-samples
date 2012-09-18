class MailController < ApplicationController
  def mail
  end

	def sendMail
		#current_time = Time.now
		from = params[:form][:from]
  	toMail = params[:form][:toMail]
  	subjectTheme = params[:form][:subject]
  	content = params[:form][:content]
  	server = params[:form][:server] #'smtp.gmail.com'
  	port = params[:form][:port] #gmail: 587
  	domain = params[:form][:domain]
  	user = params[:form][:user]
  	pass = params[:form][:pass]
  		
	#msgstr = <<-END_OF_MESSAGE
	#msgstr = From: Sender <#{from}> 
  #    To: Destiny <#{toMail}>
  #    Subject: #{subjectTheme}
  #    Message-Id: <noId>
  
  msgstr = <<-END_OF_MESSAGE
Subject: #{subjectTheme}
From: #{from}
To: #{toMail}
Date: #{Time.now.rfc2822}

#{content}
  END_OF_MESSAGE

  require 'tlsmail'
	require 'net/smtp'

	Net::SMTP.enable_tls(OpenSSL::SSL::VERIFY_NONE)
	Net::SMTP.start(server, port, Socket.gethostname, user, pass,:login) do |server|
  		server.send_message msgstr, from, toMail
	end
	#redirect_to :action => 'mail'

  		#rescue Exception => e  
  		#	print "Exception occured: " + e  
  		#end

  rescue => e 
    flash[:error] = e.message
  ensure
    redirect_to :action => 'mail'
	end
end
