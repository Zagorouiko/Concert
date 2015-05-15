require('spec_helper')

describe(Venue) do
it('ensures the length of name to be no more than 50 characters') do
  venue = Venue.new({:name => "W".*(51)})
  expect(venue.save()).to(eq(false))
end
end
