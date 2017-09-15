require 'featured_items'

module ApplicationHelper
  def featured_maps
    FeaturedItems.maps
  end

  def featured_collections
    FeaturedItems.collections
  end
end
