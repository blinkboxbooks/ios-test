Given(/^I am signed in(?: as an existing user)?$/) do
  enter_app_as_existing_user
end

When(/^I sign in$/) do
  enter_app_as_existing_user
end

When(/^I navigate to the Sign in page$/) do
  navigate_to_signin_page
end

And(/^I submit valid sign in details$/) do
  username = test_data['users']['existing']['emailaddress']
  password = test_data['users']['existing']['password']
  sign_in_page.submit_sign_in_details(username, password)
end

And(/^I should see the "([^"]*)" option in the settings menu$/) do |expected_text|
  expect_option_in_settings_menu(expected_text)
end