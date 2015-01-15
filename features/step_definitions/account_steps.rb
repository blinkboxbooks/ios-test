When /^I try to sign in with an unregistered email address$/ do
  submit_sign_in_details(test_data['emails']['dummy_email'], test_data['passwords']['valid_password'])
end

When /^I try to sign in with an incorrect password$/ do
  submit_sign_in_details(test_data['emails']['happypath_user'], test_data['passwords']['not_matching_password'])
end

Then /^sign in is not successful$/ do
  expect_page(sign_in_page)
end