require('spec_helper')
require('launchy')

describe('the path to the venues page', {:type => :feature}) do
  it('adds a venue and displays it') do
    visit('/')
    fill_in('name', with: "Crystal Ballroom")
    click_on('Submit')
    expect(page).to have_content('Venues')
  end

    it('displays the list of bands') do
     visit("/bands")
     expect(page).to have_content("All Bands")
    end

    it('displays the form to add a new band') do
     visit("/bands/new")
     expect(page).to have_content("Add a New Band")
  end

  it("adds a band and also adds it to a venue") do
  test_venue = Venue.create({:name => 'crystal ballroom'})
  visit('/bands/new')
  fill_in("band1", with: "tool")
  check(test_venue.name)
  click_button('Add a Band')
  expect(page).to have_content(test_venue.name)
 end

 it('updates a bands name') do
   venue = Venue.create(:name => "Crystal Ballroom")
   band = Band.create(:name => "Tool")
   visit('/venue/#{venue.id}/band/#{band.id}')
   fill_in('name', with: "Tool2")
   click_on('Update Band')
   expect(page).to have_content('Tool2')
end

it('deletes a bands name') do
  venue = Venue.create(name: => "Crystal Ballroom")
  band = Band.create(name: => "Tool")
  visit('/venue/#{venue.id}/band/#{band.id}')
  fill_in('name', with: "Tool2")
  click_on('Delete Band')
  expect(page).to have_content(test_venue.name)
end
end
