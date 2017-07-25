feature 'FEATURE: submitting a new link' do
  scenario 'adding a new link' do
    visit '/links/new'
    fill_in('title', with: 'Twitter')
    fill_in('url', with: 'https://twitter.com')
    click_button 'Add'
    expect(page).to have_content("Title: Twitter URL: https://twitter.com")
  end
end
