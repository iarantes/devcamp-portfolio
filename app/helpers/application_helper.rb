module ApplicationHelper
  def login_helper
    if current_user.is_a?(User)
      link_to 'Logout', destroy_user_session_path, data: { turbo_method: :delete, turbo_confirm: 'Are you sure?' }
    else
      (link_to 'Register', new_user_registration_path) +
      "<br>".html_safe +
      (link_to 'Login', new_user_session_path)
    end
  end

  def source_helper(layout_name)
    if session[:source]
      greeting = "Thanks for visiting me from #{session[:source]} and you are on the #{layout_name} layout"
      content_tag(:p, greeting, class: "source-greeting")
    end
  end

  def copyright_generator
    @copyright = ArantesViewTool::Renderer.copyright 'Igor Alves Arantes', 'All rights reserved'
  end  
end
