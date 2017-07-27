feature 'Adding tags' do

  scenario 'I can tag a single link' do
    visit('/links/new')
    fill_in('title', with: 'Twitter')
    fill_in('url', with: 'https://twitter.com')
    fill_in('tags', with: 'social')

    click_button("Add")
    link = Link.first
    expect(link.tags.map(&:name)).to include('social')
  end
end
