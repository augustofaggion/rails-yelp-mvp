module ApplicationHelper
  def star_rating(rating)
    html = ""
    rating.to_i.times { html += "<i class='fas fa-star'></i>" }
    html.html_safe
  end
end
