class ContactsController < ApplicationController
  before_action :set_contact, only: %i[show]
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
