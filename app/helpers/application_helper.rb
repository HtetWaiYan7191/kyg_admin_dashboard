module ApplicationHelper
        def dashboard_active
            request.path == "/" ? " active fw-bolder" : ""
        end
    
        def blog_active
            (request.path.starts_with?(blogs_path) || controller_name == 'blogs') && action_name != 'show' ? "active fw-bolder" : ""
        end
    
        def account_active
            (request.path.starts_with?(users_path) || controller_name == 'users') && action_name != 'show' ? "active fw-bolder" : ""
        end
    
        def testimonial_active
            (request.path.starts_with?(testimonials_path) || controller_name == 'testimonials') && action_name != 'show' ? 'active fw-bolder' : ''
            #request.path == testimonials_path ? "active fw-bolder" : ""
        end
    
        def contact_active
            (request.path.starts_with?(contacts_path) || controller_name == 'contacts') && action_name != 'show' ? 'active fw-bolder' : ''
        end
    
        def category_active
            request.path == categories_path ? "active fw-bolder " : ""
        end

        def brand_category_active
            (request.path.starts_with?(brand_categories_path) || controller_name == 'brand_categories') && action_name != 'show' ? 'active fw-bolder' : ''
        end

        def brand_partner_active
            (request.path.starts_with?(brand_partners_path) || controller_name == 'brand_partners') && action_name != 'show' ? 'active fw-bolder' : ''
        end

        def kings_yangon_users_active
            (request.path.starts_with?(kings_yangon_users_path) || controller_name == 'kings_yangon_users') && action_name != 'show' ? 'active fw-bolder' : ''
        end

        def sign_in_page?
           ( request.path == '/users/sign_in' || request.path == '/kings_yangon_users/sign_in_page') ? 'vh-100' : 'vh-75'
        end

        # view file logic helpers 

        def calculate_percentage(value, percent) 
            percentage_price = (value/100) * percent
            result = value - percentage_price
            number_to_currency(result, precision: 2)
        end

end
