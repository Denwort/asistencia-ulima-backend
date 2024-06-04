require 'sinatra'

get '/level/list' do
  Level.all.to_json
end
