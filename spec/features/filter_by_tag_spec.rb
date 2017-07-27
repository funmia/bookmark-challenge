feature 'Filtering links by tags' do
  before(:each) do
   Link.create(title: 'Google', url: 'https://google.com', tags: [Tag.first_or_create(name: 'education')])
   Link.create(title: 'Tesco', url: 'https://tesco.com', tags: [Tag.first_or_create(name: 'food')])
  end

  scenario 'I can find a specific link by tag' do
    visit '/tags/education'

    within 'ul#links' do
      expect(page).to have_content 'education'
      expect(page).not_to have_content 'food'
    end
  end
end
