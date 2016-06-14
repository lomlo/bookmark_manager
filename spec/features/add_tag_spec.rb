
feature 'adding tag to a link' do
  scenario 'user adds tag to a link on bookmark manager' do
    visit '/add_link'
    fill_in 'name', with: 'Yahoo'
    fill_in 'url', with: 'http://www.yahoo.co.uk'
    fill_in 'tag', with: 'search engine'
    click_button 'Create Bookmark'
    expect(current_path).to eq '/'
    expect(page).to have_content('Tag: search engine')
  end
 end
