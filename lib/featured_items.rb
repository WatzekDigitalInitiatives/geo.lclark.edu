module FeaturedItems
  def self.collections
    [
      { title: 'Historic Maps of Portland', description: 'A collection of maps depicting Portland from the mid-nineteenth century onward', f: { 'dct_isPartOf_sm' => ['Historic Maps of Portland'] } },
      { title: 'Oregon Metro RLIS', description: 'Layers from Oregon Metro\'s Regional Land Information System', f: { 'dct_isPartOf_sm' => ['Oregon Metro RLIS'] } },
      { title: 'Lewis & Clark Expedition Maps', description: 'Historic maps of the Lewis & Clark expedition and the Corps of Discovery', f: { 'dct_isPartOf_sm' => ['Lewis & Clark Expedition Maps'] } }
    ]
  end

  def self.maps
    [
      { title: '1866 Trolley Map of Portland, Oregon', slug: 'portland_trolley1866_modifiedB' },
      { title: 'EPA 2014 Toxics Release Inventory - Oregon', slug: 'or-tri-shape' },
      { title: 'Lewis & Clark Expedition Route', slug: 'lctrail' }
    ]
  end
end
