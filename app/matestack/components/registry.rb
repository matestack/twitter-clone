module Components::Registry

  def post_component(post:)
    Components::Post.(post: post)
  end

end