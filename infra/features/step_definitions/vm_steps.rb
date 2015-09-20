Given(/^I have a vm at "(.*?)"$/) do |host|
  @host = host
  command = %W(up webserver dbserver)
  system 'vagrant', *command
  command = %W(provision webserver dbserver)
  expect (system 'vagrant', *command) == true
end

Then(/^I can log on as "(.*?)"$/) do |user|
  output=`ssh "#{user}@#{@host}" exit`
  expect $?.success? == true
end

When(/^I start the web service$/) do
  system('cd .. && cap staging deploy && cap staging deploy:restart')
end

And(/^I navigate to it$/) do
  visit "http://#{@host}"
end

Then(/^I see "(.*?)"$/) do |arg1|
  expect(page).to have_content(arg1)
end
