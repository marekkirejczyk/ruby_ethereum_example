class GreetersController < ApplicationController

  skip_before_filter :verify_authenticity_token

  PATH = "#{Dir.pwd}/contracts/greeter.sol"

  def show
    @contract = Ethereum::Contract.create(file: PATH, address: status_params[:id])
  end
  
  def new
  end
  
  def status
    contract_receipt = Ethereum::Singleton.instance.eth_get_transaction_receipt(status_params[:id])
    deployed = contract_receipt["result"]["blockHash"].present?
    render text: deployed ? contract_receipt["result"]["contractAddress"] : ""
  end
  
  def create    
    @contract = Ethereum::Contract.create(file: PATH)
    @tx = @contract.deploy(greeter_params[:greeting]).id
    @link = "https://testnet.etherscan.io/tx/#{@tx}"
  end

  def status_params
    params.permit(:id)
  end
   
  def greeter_params
    params.permit(:greeting)
  end

end
