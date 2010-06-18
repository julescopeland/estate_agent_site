# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def logo
    image_tag("logo.png", :alt => "Estate Agency", :class => "round", :id => "logo")
  end
end
