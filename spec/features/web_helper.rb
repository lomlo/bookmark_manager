def add_link_one_tag
  visit('/links/new')
  fill_in :url, with: 'www.makersacademy.com'
  fill_in :title, with: 'Makers Academy'
  fill_in :tags, with: 'education'
  click_button 'Add Link'
end

def add_link_two_tags
  visit('/links/new')
  fill_in :url, with: 'www.makersacademy.com'
  fill_in :title, with: 'Makers Academy'
  fill_in :tags, with: 'education ruby'
  click_button 'Add Link'
end

def sign_up(email: 'alice@example.com',
            password: '12345678',
            password_confirmation: '12345678')
  visit '/users/new'
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button 'Sign up'
end

def sign_out
  visit '/sign_out'
  click_button 'Sign Out'
end
