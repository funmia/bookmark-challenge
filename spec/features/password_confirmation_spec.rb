feature "Confirm matching password" do
  scenario "requires a matching confirmation password" do
    expect { sign_up_mismatch }.not_to change(User, :count)
    expect(page).to have_content ('Password and confirmation password do not match')
    expect(page).to have_current_path('/users')
  end
end
