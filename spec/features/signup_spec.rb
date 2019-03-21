feature '' do
  scenario '' do
    visit '/signin'
    click_button 'sign-up'
    expect(page).to have_content("Sign-up")
  end
end
