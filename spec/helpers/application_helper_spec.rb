require 'rails_helper'

describe ApplicationHelper do
  describe '.featured_collections' do
    it 'should call FeaturedItems.collections' do
      expect(FeaturedItems).to receive(:collections)
      helper.featured_collections
    end
    it 'should return the output of FeaturedItems.collections' do
      expect(helper.featured_collections).to eq(FeaturedItems.collections)
    end
  end

  describe '.featured_maps' do
    it 'should call FeaturedItems.maps' do
      expect(FeaturedItems).to receive(:maps)
      helper.featured_maps
    end
    it 'should return the output of FeaturedItems.maps' do
      expect(helper.featured_maps).to eq(FeaturedItems.maps)
    end
  end
end
