module KygAuthenticationConcern 
    extend ActiveSupport::Concern

    included do 
        helper_method :current_kyg_user, :user_signed_in_as_kyg?
    end

    def current_kyg_user 
        @current_kyg_user  ||= KingsYangonUser.find_by(id: session[:user_id]) if session[:user_id]
      end
  
      def authenticate_kyg_user! 
        unless current_kyg_user
          redirect_to sign_in_page_kings_yangon_users_path, alert: 'You need to sign in first'
        end
      end
  
      def user_signed_in_as_kyg?
        current_kyg_user.present?
      end
  
      def redirect_if_authenticated
        if user_signed_in_as_kyg?
          redirect_to landing_page_index_path, notice: 'You are already signed in.'
        end
      end
end