Given(/^I use "(.*?)" to create a vm at "(.*?)"$/) do |provider, host|
  @host = host
  @provider = provider.downcase

  `vagrant halt`

  case @provider
    when 'parallels'
      FileUtils.copy("Vagrantfile.pvm", "Vagrantfile")
      FileUtils.copy("inventory.ini.pvm", "inventory.ini")

    when 'virtualbox'
      FileUtils.copy("Vagrantfile.vb", "Vagrantfile")
      FileUtils.copy("inventory.ini.vb", "inventory.ini")
  end

  `rm -rf .vagrant`
  `vagrant up --provider #{@provider}`
  `vagrant provision`
 end
