class UserAuthService 
    def initialize(user) 
        @user = user
    end

    def is_user_management?
        @user.management?
    end        
    
    def is_admin_management?
        @user.admin?
    end
end