When(/^I tap on Forgotten your password link$/) do
  sign_in_page.click_on_reset_password_link
end

Then(/^reset password popup is displayed$/) do
  expect_page(reset_password_page)
end

When(/^I enter an email address (registered|not registered) with blinkbox books$/) do |email_type|
  email_type.include?('not') ? email_address = test_data['emails']['dummy_email'] : email_address = test_data['emails']['valid']
  reset_password_page.enter_email_address(email_address)
end

When(/^I tap on reset password button(?: without entering email address)?$/) do
  reset_password_page.click_on_reset_password_button
end

Then(/^I can see password reset email sent confirmation popup$/) do
  expect(reset_password_page).to have_we_sent_you_an_email_popup
end

Then(/^I should see the enter email address pop up/) do
  expect(reset_password_page).to have_enter_your_email_address_popup
end

Then(/^I should see the enter a valid email address pop up/) do
  expect(reset_password_page).to have_enter_your_valid_email_address_popup
end

And(/^I can close the pop up$/) do
  reset_password_page.click_on_ok_to_close_popup
  expect(reset_password_page)
end

When(/^I enter (.*) email address$/) do |invalid_email|
  reset_password_page.enter_email_address(invalid_email)
end
