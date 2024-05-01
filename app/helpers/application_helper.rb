module ApplicationHelper
        def dashboard_active
            request.path == "/" ? " active fw-bolder" : ""
        end
    
        def blog_active
            request.path == blogs_path ? "active fw-bolder" : ""
        end
    
        def account_active
            
        end
    
        def testimonial_active
            request.path == testimonials_path ? "active fw-bolder" : ""
        end
    
        def contact_active
            request.path == contacts_path ? "active fw-bolder" : ""
        end
    
        def category_active
            request.path == categories_path ? "active fw-bolder " : ""
        end
end
