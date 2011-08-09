class ContactsController < ActionController::Base
  respond_to :html, :xml, :json
  
  def show
    @contact = Contact.find(params[:id])
   
    respond_with(@client) 
  end
  
  def create
    @client = Client.find(params[:client_id])
    @contact = @client.contacts.create(params[:contact])
    redirect_to client_path(@client)
  end
 
  def destroy
    @client = Client.find(params[:id])
    @contact = @client.contacts.find(params[:id])
    
    flash[:notice] = "Contacts deleted successfully." if @contact.destroy
    respond_with(@contact) do |format|
      format.html { redirect_to client_path(@client) }
    end
  end  
  
end