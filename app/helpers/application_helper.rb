module ApplicationHelper
    include ActionView::Helpers::TextHelper

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

        def is_sign_in_page?
            request.path == '/users/sign_in' || request.path ==  '/kings_yangon_users/sign_in_page' || request.path == '/users/password/new'
        end

        def banner_active
            ( request.path.starts_with?(banners_path) || controller_name == 'banners' ) && action_name != 'show' ? 'active fw-bolder' : ''
        end

        # view file logic helpers 

        def calculate_percentage(value, percent) 
            percentage_price = (value/100) * percent
            result = value - percentage_price
            number_to_currency(result, precision: 2)
        end

        def format_date(date)
            date.strftime('%Y-%m-%d')
        end

        def calculate_minutes(word_count)
            words_per_minute = 200 # Adjust this value based on the average reading speed
            minutes = (word_count.to_f / words_per_minute).ceil
            minutes
        end

        def get_word_count(blog_content)
        words = blog_content.split
        word_count = words.size
        word_count
        end
end
