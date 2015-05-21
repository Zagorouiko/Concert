require("bundler/setup")
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }
require('pry')

#--------------------index
get('/') do
  @venues = Venue.all
  erb(:index)
end

#--------------------post new venue
post('/') do
  name = params.fetch('name')
  Venue.create({:name => name})
  redirect('/')
end

#--------------------venue page with bands
get('/venue/:id/bands') do
  id = params.fetch('id').to_i
  @venue = Venue.find(id)
  @bands = @venue.bands()
  erb(:bands)
end

get('/band/:id/venues') do
  id = params.fetch('id').to_i
  @band = Band.find(id)
  @venues = @band.venues()
  erb(:venues)
end


delete('/band/:id/venues/') do
  id = params.fetch('id').to_i
  band = Band.find(id)
  band.destroy()
  redirect('/bands')
end

#---------------------delete venue
delete('/venue/:id') do
  id = params.fetch('id').to_i
  venue = Venue.find(id)
  venue.destroy()
  redirect('/')
end

#----------------------create a new band
get('/bands/new') do
  @venues = Venue.all
  erb(:band_form)
end

post('/bands') do
  name = params.fetch('band1')
  venue_ids = params.fetch('venue_ids')
  new_band = Band.create({:name => name})
  length = venue_ids.length()
  length.times() do |time|
    id = venue_ids[time].to_i
    venue = Venue.find(id)
    venue.bands.push(new_band)
  end
  redirect('/')
end

#-----------------------one band page
get('/venue/:venue_id/band/:id') do
  id = params.fetch('id').to_i
  venue_id = params.fetch('venue_id').to_i
  @venue = Venue.find(venue_id)
  @band = Band.find(id)
  erb(:band)
end

#-------------------------see all bands
get('/bands')do
erb(:all_bands)
end

#-------------------------update a band
patch('/venue/:venue_id/band/:id') do
  name = params.fetch('name')
  id = params.fetch('id').to_i
  @band = Band.find(id)
  @band.update({:name => name})
  venue_id = params.fetch('venue_id')
  @venue = Venue.find(venue_id)
  erb(:band)
end

#---------------------delete a band
delete('/venue/:venue_id/band/:id') do
  id = params.fetch('id').to_i
  band = Band.find(id)
  band.destroy()
  venue_id = params.fetch('venue_id').to_i
  @venue = Venue.find(venue_id)
  @bands = @venue.bands()
  erb(:bands)
end
