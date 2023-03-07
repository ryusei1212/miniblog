module ApplicationHelper
  def posted_image(image)
    if image.attached?
      image_tag image, alt: '画像', width: '10%', height: '10%'
    end
  end
end
