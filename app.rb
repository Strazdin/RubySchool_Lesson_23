#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end

get '/about' do
	erb :about
end

get '/contacts' do
	erb :contacts
end

get '/visit' do
	erb :visit
end

get '/admin' do
	erb :admin
end

post '/visit' do

	@user_name = params[:user_name]
    @phone     = params[:phone]
    @date_time = params[:date_time]
	@hairdresser = params[:hairdresser]

	@title   = 'Thank you!'
    @message = "Dear #{@user_name}, we'll be wating for you at #{@date_time} at the selected hairdresser #{@hairdresser}"

    f = File.open './public/vendor/contacts.txt', 'a'
    f.write "User: #{@user_name} Phone: #{@phone} Date and time: #{@date_time}Hairdresser: #{@hairdresser}\n"
    f.close


	erb :visit

end

post '/admin' do

	@admins     = params[:admin]
    @admin_pas = params[:admin_pas]
	if @admins == "admin" && @admin_pas == "barber" 
		@title = 'Successfully'
		@message = 'message ....'
	else
		@title = 'Access denied'
	end
	erb :admin
end