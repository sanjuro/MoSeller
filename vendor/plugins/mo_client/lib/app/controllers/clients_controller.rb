class ClientsController < ActionController::Base
  
  before_filter :authenticate_user!

  respond_to :html, :xml, :json
  
  def index
    @clients = Client.all
    respond_with(@clients)
  end
  
  
  def new
    @client = Client.new(params[:client])
    flash[:notice] = "Client was created successfully." if @client.save
    respond_with(@client)  
  end
  
  
  def show
    @client = Client.find(params[:id])
   
    respond_with(@client) 
  end
 
  
  def destroy
    @client = Client.find(params[:id])

    flash[:notice] = "Client was deleted successfully." if @client.destroy
    respond_with(@client) do |format|
      format.html { redirect_to(clients_url) }
    end
  end  
  
end