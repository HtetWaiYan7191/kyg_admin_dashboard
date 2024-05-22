module KygAuthenticationConcern 
    extend ActiveSupport::Concern

    included do 
        helper_method :current_kyg_user, :user_signed_in_as_kyg?, :check_management_access
    end

    def current_kyg_user 
        @current_kyg_user  ||= KingsYangonUser.find_by(id: session[:user_id]) if session[:user_id]
    end
  
      def authenticate_kyg_user! 
        unless user_signed_in_as_kyg?
          redirect_to sign_in_page_kings_yangon_users_path, alert: 'You need to sign in first'
        # else user_signed_in? 
        #   redirect_to root_path, alert: 'You need to sign in as a kings yangon user'
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

      def user_management?
        current_user && UserAuthService.new(current_user).is_user_management?
      end

      def user_admin?
        current_user && UserAuthService.new(current_user).is_admin_management?
      end

      def check_management_access
        unless user_management?
          redirect_back(fallback_location: root_path, alert: 'You do not have access to this page.')
        end
      end

      def check_admin_access
        unless user_admin?
          redirect_back(fallback_location: brand_categories_path, alert: 'You do not have access to this page.')
        end
      end


end