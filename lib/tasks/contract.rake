namespace :contract do

  desc "Compile and deploy contract"
  task :deploy do
    path = "#{Dir.pwd}/contracts/greeter.sol" 
    puts "Deploing contract #{path}"  
    contract = Ethereum::Contract.create(file: path)
    address = contract.deploy_and_wait("Hello from blokchain!") { puts "." }

    greeter = Ethereum::Contract.create(file: path, address: address)
    puts "Contract deployed under address: #{address}"
    puts "greeter.greet: #{greeter.call.greet}"
  end

end

