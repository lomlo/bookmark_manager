
feature 'adding tag to a link' do
  scenario 'user adds tag to a link on bookmark manager' do
    visit '/add_link'
    fill_in 'name', with: 'Yahoo'
    fill_in 'url', with: 'http://www.yahoo.co.uk'
    fill_in 'tag', with: 'search_engine'
    click_button 'Create Bookmark'
    link = Link.first
    expect(link.tags.map(&:name)).to include('search_engine')
  end
  # I would like to add tags to the links in my bookmark manager
  scenario 'I would like to add multiple tags to a link' do
    visit '/add_link'
    fill_in 'name', with: 'Yahoo'
    fill_in 'url', with: 'http://www.yahoo.co.uk'
    fill_in 'tag', with: 'search_engine education'
    click_button 'Create Bookmark'
    link = Link.first
    expect(link.tags.map(&:name)).to include('search_engine', 'education')
  end
 end
