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
            request.path == contacts_path ? "active fw-bolder" : ""
        end
    
        def category_active
            request.path == categories_path ? "active fw-bolder " : ""
        end

        def brand_category_active
            request.path == brand_categories_path ? "active fw-bolder " : ""
        end

        def brand_partner_active
            request.path == brand_partners_path ? "active fw-bolder " : ""
        end

        def item_active
            request.path == items_path ? "active fw-bolder " : ""
        end
end
