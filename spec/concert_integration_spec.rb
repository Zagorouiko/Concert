require('spec_helper')
require('launchy')

describe('the path to the index', {:type => :feature}) do
  it('shows the front page') do
    visit('/')
    expect(page).to have_content('PDX EvenHub')
  end
end
