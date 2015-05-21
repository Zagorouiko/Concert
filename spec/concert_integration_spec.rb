require('spec_helper')
require('launchy')
require("pry")

describe('Sinatra checks', {:type => :feature}) do
  it('adds a venue and displays it') do
    visit('/')
    fill_in('name', with: "Crystal ballroom")
    click_on('Submit')
    expect(page).to have_content('Venues')
  end

  it("displays the venue page with the bands") do
    visit('/')
    fill_in('name', with: "Crystal ballroom")
    click_on('Submit')
    click_on('Crystal ballroom')
    expect(page).to have_content("Crystal ballroom Bands")
  end

  it("deletes a venue") do
    visit('/')
    fill_in('name', with: "Crystal ballroom")
    click_on('Submit')
    click_on('Crystal ballroom')
    click_button("Delete Venue")
    expect(page).to have_content("You have not saved any venues yet.")
  end

  it('displays the list of bands') do
     visit("/bands")
     expect(page).to have_content("All Bands")
    end

    it('displays the form to add a new band') do
     visit("/bands/new")
     expect(page).to have_content("There are no bands or venues yet. Please add a band or venue first.")
  end

  it("Adds a band") do
    venue1 = Venue.create(name: "Crystal ballroom")
    visit('/bands/new')
    fill_in("band1", with: "tool")
binding.pry
    check(venue1.id)
    click_button("Add a Band")
    expect(page).to have_content("Crystal ballroom")
  end
end
##
