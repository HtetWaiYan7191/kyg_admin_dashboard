class Api::V1::ContactsController < ApplicationController
  before_action :set_contact, only: %i[ show edit update destroy ]

  # GET /api/v1/contacts or /api/v1/contacts.json
  def index
    @contacts = Contact.all
  end

  # GET /api/v1/contacts/1 or /api/v1/contacts/1.json
  def show
  end

  # GET /api/v1/contacts/new
  def new
    @contact = Contact.new
  end

  # GET /api/v1/contacts/1/edit
  def edit
  end

  # POST /api/v1/contacts or /api/v1/contacts.json
  def create
    @contact = Contact.new(contact_params)

    respond_to do |format|
      if @contact.save
        format.html { redirect_to contact_url(@contact), notice: "Contact was successfully created." }
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /api/v1/contacts/1 or /api/v1/contacts/1.json
  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to contact_url(@contact), notice: "Contact was successfully updated." }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /api/v1/contacts/1 or /api/v1/contacts/1.json
  def destroy
    @contact.destroy!

    respond_to do |format|
      format.html { redirect_to contacts_url, notice: "Contact was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def contact_params
      params.fetch(:contact, {})
    end
end
