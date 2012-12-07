require "sinatra"
require "sinatra/reloader"
require 'debugger'
require "lib/user_list"

set :public_folder, File.dirname(__FILE__) + '/public'


get '/' do
	erb :index
end

post '/login' do
	user = params[:user]

	redirect "/list/#{user}"
end

get '/list/:name' do
	@name = params[:name]
	puts params
	@items= []
	File.open(@name, 'a+').each do |item|
		@items << item 	
	end
	erb :list 
end

post '/add/:name' do
	@name = params[:name]
	@item = params[:listItem]  
	File.open(@name, 'a+') do |file|
		file.puts @item
	end
	redirect "/list/#{@name}"
end
