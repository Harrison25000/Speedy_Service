feature 'sign in page works' do
  scenario 'page has sign in form' do
    visit '/signin'
    expect(page).to have_content('Speedy Service')
  end
end
