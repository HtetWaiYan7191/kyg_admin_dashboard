class Api::V1::ContactsController < ApiController
  # POST /api/v1/contacts or /api/v1/contacts.json
    skip_before_action :verify_authenticity_token, only: [:create]

  def create
    @contact = Contact.new(contact_params)
      if @contact.save
        render json: {data: @contact}, status: :ok
      else
        render json: {data: @contact.errors.full_messages.join(',')}, status: :unprocessable_entity
      end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def contact_params
      params.permit(:address, :birth_date, :current_year_group, :current_school, :email, :gender, :message, :nationality, :parent_name, :phone_number, :student_name)
    end
end
