class ContactsController < ApplicationController
  load_and_authorize_resource
  before_action :set_contact, only: %i[show edit update destroy]
  # before_action :check_admin_access

  def index
    @contacts = Contact.all.order(created_at: :desc).page(params[:page]).per(4)
  end

  def show
    
  end

  def edit 

  end

  def update 

  end

  def destroy
    if @contact.destroy
      redirect_to contacts_path, notice: 'Contact deleted successfully!'
    end
  end

  private 
  def set_contact
    @contact = Contact.find(params[:id])
  end
end
