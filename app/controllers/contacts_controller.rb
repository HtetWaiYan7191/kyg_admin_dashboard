class ContactsController < ApplicationController
  load_and_authorize_resource
  before_action :set_contact, only: %i[show]
  # before_action :check_admin_access

  def index
    @contacts = Contact.all 
  end

  def show
    
  end

  private 
  def set_contact
    @contact = Contact.find(params[:id])
  end
end
