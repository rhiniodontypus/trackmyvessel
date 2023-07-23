#!/usr/bin/env ruby
# encoding: utf-8

require 'mail'

class Mailer
  
  def maildefaults
    options = { 
      :address              => 'your.mailserver.net',
      :port                 => 465, # or 587
      :ssl                  => true,
      :enable_starttls_auto => true,
      :domain               => 'mailserver.net',
      :authentication       => 'login',
      :user_name            => '<username>',
      :password             => '<password>'
    }
    Mail.defaults do
      delivery_method :smtp, options
    end
  end
  
  def maildelivery(body_v)
    message = Mail.new do
      to '<your_mail_address>'
      from '<your_sender_mail_address>'
      subject 'Aktulle Schiffsinformation'
      body "#{body_v}"
    end.deliver
  end
end  
