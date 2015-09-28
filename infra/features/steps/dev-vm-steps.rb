require 'net/ssh'

When(/^log on as "(.*?)"$/) do |user|
  @user = user
  result = run_remote("ssh #{@user}@#{@host}")
  expect $?.success? == true
end

Then(/^I can build the "(.*?)" image$/) do |project|
  @project = project
  result = run_remote("cd nrf/projects/#{project} && make clean && make")
  expect(result).to match(/FruityMesh.hex/)
end

Then(/^I see the result$/) do
  result = run_remote("ls nrf/projects/#{@project}/_build/FruityMesh.hex")
  expect(result).to match(/FruityMesh.hex/)
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
