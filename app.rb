require 'sinatra'
require 'sinatra/partial'

register Sinatra::Partial
set :partial_template_engine, :erb

before do
  expires 3600, :public, :must_revalidate
end

#Index page
['/?', '/index', '/index.html'].each do |path|
  get path do
    erb :index
  end
end

get '*' do |path|
  redirect to('/')
end