class LocationsController < ActionController::Base
  
  def show
    @location = Location.find(params[:id])
   
    respond_to do |format|
      format.html # client/show.html.erb
      format.xml  { render :xml => @location }
      format.json  { render :json => @location }
    end
  end
  
  def create
    @client = Client.find(params[:client_id])
    @location = @client.locations.create(params[:contact])
    redirect_to client_path(@client)
  end
 
  def destroy
    @client = Client.find(params[:client_id])
    @location = @client.locations.find(params[:id])
    @location.destroy
    redirect_to client_path(@client)
  end  
  
end