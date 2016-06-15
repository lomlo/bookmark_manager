
feature 'View Links' do

  before(:each) do
    Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy', tags: [Tag.first_or_create(name: 'education')])
    Link.create(url: 'http://www.google.com', title: 'Google', tags: [Tag.first_or_create(name: 'search')])
    Link.create(url: 'http://www.zombo.com', title: 'This is Zombocom', tags: [Tag.first_or_create(name: 'bubbles')])
    Link.create(url: 'http://www.bubble-bobble.com', title: 'Bubble Bobble', tags: [Tag.first_or_create(name: 'bubbles')])
    end

  scenario 'shows a list of links on the homepage'do
    Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
    visit '/links'
    expect(page.status_code).to eq 200

    within 'ul#links' do
      expect(page).to have_content('Makers Academy')
    end
  end

  scenario 'filters links by specified tag' do
    visit '/tags/bubbles'
      within 'ul#links' do
    expect(page).to_not have_content('Makers Academy')
    expect(page).to_not have_content('Google')
    expect(page).to have_content('This is Zombocom')
    expect(page).to have_content('Bubble Bobble')
      end
  end
end

