class AccountItemsController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound, :with => :render_404  
  helper :base  
  
  before_filter :authenticate_user!
  
  def index
    @account_items = AccountItem.by_user_id(current_user.id).order('account_item.created_at DESC').paginate(:page => params[:page])
      
    unformatted_account_items = AccountItem.by_user_id(current_user.id)
    
    debit = unformatted_account_items.map(&:debit).sum
    credit = unformatted_account_items.map(&:credit).sum
    
    @account_balance = debit - credit  
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @account_items }
      format.json  { render :json => @account_items }
    end
  end
  
  def show
    @account_items = AccountItem.find_all_by_user_id(current_user.id).paginate(:page => params[:page])
    
    debit = @account_items.map(&:debit).sum
    credit = @account_items.map(&:credit).sum
    
    @account_balance = debit - credit  
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @account_items }
      format.json  { render :json => @account_items }
    end
  end  
  
end