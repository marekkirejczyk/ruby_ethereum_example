class GreetersController < ApplicationController

  def index
    path = "#{Dir.pwd}/contracts/greeter.sol" 
    contract = Ethereum::Contract.create(file: path, address: "0x7ff1875dc0e62ab1459688bdbe3f3df112f2097e")
    render text: contract.call.greet
  end
end
