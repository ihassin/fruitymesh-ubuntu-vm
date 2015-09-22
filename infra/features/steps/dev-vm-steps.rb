require 'net/ssh'

Given(/^I have a vm at "(.*?)"$/) do |host|
  @host = host
  command = %W(up)
  system 'vagrant', *command
  command = %W(provision)
  expect (system 'vagrant', *command) == true
end

When(/^log on as "(.*?)"$/) do |user|
  @user = user
  output=`ssh "#{user}@#{@host}" exit`
  expect $?.success? == true
end

Then(/^I can build the "(.*?)" image$/) do |project|
  @project = project
  result = run_remote("ssh #{@user}@#{@host} && cd nrf/projects/#{project} && make clean && make")
  expect $?.success? == true
end

def run_remote(command, verbose = false)
  Net::SSH.start(@host, @user) do |ssh|
    if verbose
      ssh.exec(command)
    else
      ssh.exec!(command)
    end
  end
end

Then(/^I see the result$/) do
run_remote("ls nrf/projects/#{@project}/_build/FruityMesh.hex", true)
end
