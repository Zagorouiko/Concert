require('spec_helper')

describe(Band) do
it('ensures the length of name to be no more than 50 characters') do
  band = Band.new({:name => "W".*(51)})
  expect(band.save()).to(eq(false))
end
end
