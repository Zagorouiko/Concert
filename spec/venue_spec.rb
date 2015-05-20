require('spec_helper')

describe(Venue) do
  it { should have_and_belong_to_many(:bands) }

it('ensures the length of name to be no more than 50 characters') do
  venue = Venue.new({:name => "W".*(51)})
  expect(venue.save()).to(eq(false))
end

it('capitalizes the name of the venue') do
    test_venue = Venue.create({:name => "crystal ballroom"})
    expect(test_venue.name()).to(eq("Crystal ballroom"))
  end

  it("ensures input has a name") do
    venue = Venue.new(name: "")
    expect(venue.save).to eq(false)
  end
end
