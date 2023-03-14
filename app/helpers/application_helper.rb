module ApplicationHelper
  def gravatar_for(user, size: 30)
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}&d=identicon"
    link_to user_path(user) do
      image_tag(gravatar_url, alt: user.name, class: 'rounded-circle')
    end
  end
end
