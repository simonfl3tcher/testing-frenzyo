require 'rails_helper'

RSpec.feature "Projects", type: :feature do
  scenario 'User creates a new project' do
    user = FactoryGirl.create(:user)
    login_as user, scope: :user

    visit root_path

    expect {
      click_link 'New Project'
      fill_in 'Name', with: 'Test Project'
      fill_in 'Description', with: 'Trying out capybara'
      click_button 'Create Project'

      expect(page).to have_content 'Project was successfully created'
      expect(page).to have_content 'Test Project'
      expect(page).to have_content "Owner: #{user.name}"
    }.to change(user.projects, :count).by(1)
  end
end