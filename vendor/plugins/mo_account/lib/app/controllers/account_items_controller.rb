class AccountItemsController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound, :with => :render_404  
  helper :base  
  
  before_filter :authenticate_user!, :set_current_user
  
  def index
    @account_items = AccountItem.find_all_by_user_id(current_user.id).paginate(:page => params[:page])
   
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @account_items }
      format.json  { render :json => @account_items }
    end
  end
  
end