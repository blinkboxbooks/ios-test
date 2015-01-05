Given(/a valid user account(?: ready for use on a new device)?$/) do
  user_interface.deregister_all_devices
end

Then(/^the ([A-Za-z\-\s]*) should be displayed$/) do |page_name|
  page = page_model_instance(page_name)
  expect_page(page)
end

Given(/^the My Library screen is displayed$/) do
  enter_app_as_anonymous_user
  expect_page(my_library_page)
end

Given(/^the Welcome screen is displayed$/) do
  expect_page(welcome_page)
end

And(/^I press enter$/) do
  done
end