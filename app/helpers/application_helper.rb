module ApplicationHelper
	def login_helper
    if current_user.is_a?(GuestUser)
      (link_to "Register", new_user_registration_path) +
      "<br>".html_safe +
      (link_to "Login", new_user_session_path)
    else
      link_to "Logout", destroy_user_session_path, method: :delete
    end
  end

  def nav_items
		[ 
			{
				url: root_path,
				title: '<i class="material-icons" style="font-size: 3em;">home</i>'
				},{
				url: contact_path,
				title: '<i class="material-icons" style="font-size: 2.5em;">phone</i>'
				},{
				url: about_path,
				title: '<i class="material-icons" style="font-size: 3em;">assignment_ind</i>'
				},{
				url: blogs_path,
				title: '<i class="material-icons" style="font-size: 3em;">group_work</i>'
				},{
				url: portfolios_path,
				title: '<i class="material-icons" style="font-size: 4em;">panorama</i>'
				},{
				url: new_charge_path,
				title: '<i class="material-icons" style="font-size: 4em;">payment</i>'
				}
			]
	end

	def nav_helper style, tag_type
		nav_links = ''
		nav_items.each do |item|
			nav_links << "<#{tag_type}><a href='#{item[:url]}' class='#{style} #{active? item[:url]}'>#{item[:title]}</a></#{tag_type}>"
	end

	  nav_links.html_safe
  end
  
  def active? path
		"active" if current_page? path
	end
end
