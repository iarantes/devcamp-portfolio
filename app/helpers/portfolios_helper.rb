module PortfoliosHelper
  def image_generator(height:, width:)
    "https://placehold.co/#{height}x#{width}"
  end

  def portfolio_img img, type
    if img
      img
    elsif type == 'thumb'
      image_generator(height: '350', width: '200')
    else
      image_generator(height: '600', width: '400')
    end
  end
end
