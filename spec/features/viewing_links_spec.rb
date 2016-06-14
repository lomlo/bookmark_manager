# I would like to see a list of links on the homepage

feature 'viewing links' do
  scenario 'user visits homepage and can see links' do
    Link.create(url: 'www.google.com', name: 'google')
    visit '/'
    expect(page.status_code).to eq 200
    expect(page).to have_content('www.google.com')
  end
end
