feature 'Adding tags' do

  before(:each) do
    visit('/links/new')
    fill_in('title', with: 'Twitter')
    fill_in('url', with: 'https://twitter.com')
  end

  scenario 'I can tag a single link' do
    fill_in('tags', with: 'social')
    click_button("Add")
    link = Link.first
    expect(link.tags.map(&:name).join).to eq ('social')
  end

  scenario 'I can add multiple tags to a link' do
    fill_in('tags', with: 'news, comedy' )
    click_button("Add")
    link = Link.first
    expect(link.tags.map(&:name).join(", ")).to eq ('news, comedy')
  end
end
