require 'spec_helper'

# We can unzip software
describe package('unzip') do
  it { should be_installed }
end

# We have the cross compiler
describe file('/usr/local/gcc-arm-none-eabi-4_9-2015q2') do
  it { should be_directory }
end

# We have the dev environment
describe file('/home/deploy/nrf') do
  it { should be_directory }
end

# We have the NRF51 SDK
describe file('/home/deploy/nrf/sdk') do
  it { should be_directory }
end

# We have the FruityMesh project
describe file('/home/deploy/nrf/projects/fruitymesh') do
  it { should be_directory }
end
