# I would like to see a list of links on the homepage

feature 'viewing links' do
  before(:each) do
    Link.create(url: 'www.makersacadmey.com', name: 'makers',
    tags: [Tag.first_or_create(name: 'study')])
    Link.create(url: 'www.yahoo.com', name: 'yahoo',
    tags: [Tag.first_or_create(name: 'bubbles')])
    Link.create(url: 'www.github.com', name: 'save',
    tags: [Tag.first_or_create(name: 'study')])
    Link.create(url: 'www.heroku.com', name: 'heroku',
    tags: [Tag.first_or_create(name: 'uploads')])
  end

  scenario 'user visits homepage and can see links' do
    Link.create(url: 'www.google.com', name: 'google')
    visit '/'
    expect(page.status_code).to eq 200
    expect(page).to have_content('www.google.com')
  end
  # I would like to filter links by tag

  scenario 'I can filter links by tag' do
    visit '/tags/bubbles'
    expect(page.status_code).to eq(200)
    expect(page).not_to have_content('makers')
    expect(page).not_to have_content('save')
    expect(page).not_to have_content('heroku')
    expect(page).to have_content('yahoo')
  end
end
