 <div class="card-carousel-images w-100 " style="height: 200px" >
      <div id="carouselExample<%=item.id%>" class="carousel slide w-100 h-100">
      <div class="carousel-inner h-100">
            <% if item.images.attached? %>
              <% item.images.each do |image| %>
                <div class="carousel-item active h-100 position-relative ">
                  <%= image_tag(image, alt: "item", class: "d-block w-100 img-fluid h-100 object-fit-cover ") %> 
                  <% if item.discount_percentage %>
                    <span class="position-absolute top-0 z-3 end-0  badge text-bg-danger">-<%= number_with_precision(item.discount_percentage, precision: 0) %>% </span>
                  <% end %>
                </div>
              <% end %>
            <% end %>
      </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample<%=item.id%>" data-bs-slide="prev">
            <span class=" bi bi-arrow-left  carousel-card-arrow text-white bg-danger px-2 " aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExample<%=item.id%>" data-bs-slide="next">
            <span class=" bi bi-arrow-right  carousel-card-arrow  text-white bg-danger px-2" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
  </div>