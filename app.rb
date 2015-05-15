require("bundler/setup")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }
require('pry')

get('/') do
  @venues = Venue.all
  erb(:index)
end

post('/') do
  name = params.fetch('name')
  Venue.create({:name => name})
  redirect('/')
end

get('/venue/:id/bands') do
  id = params.fetch('id').to_i
  @venue = Venue.find(id)
  @bands = @venue.bands()
  erb(:bands)
end
