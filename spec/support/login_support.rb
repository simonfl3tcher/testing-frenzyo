module LoginSupport
  def sign_in_as(user)
    visit root_path
    click_link 'Sign in'
    fill_in 'Email', user.email
    fill_in 'Password', user.password
    click_button 'Log in'
  end
end
