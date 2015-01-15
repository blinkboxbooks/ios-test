When /^I try to sign in with an unregistered email address$/ do
  username = test_data['emails']['dummy_email']
  password = test_data['passwords']['valid_password']
  sign_in_page.submit_sign_in_details(username, password)
end

When /^I try to sign in with an incorrect password$/ do
  username = test_data['emails']['happypath_user']
  password = test_data['passwords']['not_matching_password']
  sign_in_page.submit_sign_in_details(username, password)
end

Then /^sign in is not successful$/ do
  expect_page(sign_in_page)
end