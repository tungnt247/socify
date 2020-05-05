module PostsHelper
  def post_image_url(image_url)
    image_url ? image_url : 'post_default.png'
  end
end
