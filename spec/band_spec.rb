require('spec_helper')

describe(Band) do
it('ensures the length of name to be no more than 50 characters') do
  band = Band.new({:name => "W".*(51)})
  expect(band.save()).to(eq(false))
end

it('capitalizes the name of the band') do
    test_band = Band.create({:name => "tool"})
    expect(test_band.name()).to(eq("Tool"))
  end

  it("ensures input has a name") do
    band = Band.new(name: "")
    expect(band.save).to eq(false)
  end
end
