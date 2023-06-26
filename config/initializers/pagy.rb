require 'pagy/extras/bootstrap'

# Pagination options for the Bootstrap frontend template
Pagy::DEFAULT[:bootstrap] = {
  nav: 'pagination justify-content-center',       # CSS classes for the pagination container
  combo_nav: 'form-inline justify-content-center', # CSS classes for the pagination + input combo container
  nav_link: 'page-link',                           # CSS classes for the pagination links
  prev: 'Previous',                                # Label for the previous page link
  next: 'Next',                                    # Label for the next page link
  gap: '&hellip;',                                 # Label for the gap between page links
  active: 'active',                                # CSS class for the active page link
  disabled: 'disabled',                            # CSS class for the disabled page links
}

Pagy::DEFAULT[:items] = 10       # items per page
Pagy::DEFAULT[:size]  = [1,4,4,1] # nav bar links