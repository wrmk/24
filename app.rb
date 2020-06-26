#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School!!</a>"			
end

get '/about' do
  erb :about
end

get '/visit' do
  erb :visit
end

get '/contacts' do
  erb :contacts
end

post '/visit' do
	@user_name = params[:user_name]
	@user_phone = params[:user_phone]
	@user_date_visit = params[:user_date_visit]
	@master = params[:selected_master]
	@color = params[:color]

	hh = {  :user_name => "Введите имя",
			:user_phone => "Введите телефон",
			:user_date_visit => "Введите дату и время"	}

	hh.each do |key, value|

		if params[key] == ""
			@error = hh[key]
			return erb :visit
		end
	end

	File.open('./public/visit.txt', 'a'){|f| f.write("#{@user_name},#{@user_phone},#{@user_date_visit},#{@master}, #{@color}\n")}
	erb :visit
end

post '/contacts' do
	@user_mail = params[:user_mail]
	@user_feedback = params[:user_feedback]
	File.open('./public/contacts.txt', 'a'){|f| f.write("Begin\n#{'=' * 20}\n#{@user_mail}\n#{@user_feedback}\n#{'=' * 20}\nEnd\n")}
	erb :contacts
end