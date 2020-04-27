
require 'gossip'

class ApplicationController < Sinatra::Base

	attr_accessor :gossip

  
  get '/' do
  	erb :index, locals: {gossips: Gossip.all}
	end

	get '/gossips/new/' do
  	erb :new_gossip
	end

	post '/gossips/new/' do
		count = Gossip.all.count
  	Gossip.new(count+1, params["gossip_author"], params["gossip_content"]).save
  	redirect '/'
	end

	get '/gossips/:id' do

		all_the_gossips = Gossip.all
		id = Gossip.find2(2)
	
  	@gossip = all_the_gossips.select do |gossip|
  	
    if gossip.id.to_i == params[:id].to_i
			@gossip = Gossip.find2(gossip.id.to_i)
			puts "#{@gossip}"
    end
 
  end
  erb :show, locals: {gossips: Gossip.find2(params["id"].to_i)}
	end

end
