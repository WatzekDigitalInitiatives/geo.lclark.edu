module FeaturedItems
  def self.collections
    [
      { title: 'Historic Portland Maps', description: 'A collection of maps depicting Portland from the mid-nineteenth century onward', f: { 'dct_isPartOf_sm' => ['PDX'] } },
      { title: 'ENVS220 Resource Collections', description: 'Maps and data used as part of the Environmental Studies 220 class', f: { 'dct_isPartOf_sm' => ['ENVS220'] } },
      { title: 'Lewis & Clark Expedition Maps', description: 'Historic maps of the Lewis & Clark expedition and the Corps of Discovery', f: { 'dct_isPartOf_sm' => ['LCtrail'] } }
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
