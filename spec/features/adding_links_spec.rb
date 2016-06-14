# I would like to add the site's address and title to my bookmark manager

feature 'user can add links to their homepage' do
  scenario 'user adds site name and address to bookmark' do
    visit '/add_link'
    fill_in 'name', with: 'Yahoo'
    fill_in 'url', with: 'http://www.yahoo.co.uk'
    click_button 'Create Bookmark'
    expect(current_path).to eq '/'
    expect(page).to have_content('Yahoo')
  end
end
