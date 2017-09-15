require 'rails_helper'

describe FeaturedItems do
  describe '.collections' do
    it 'should return an array' do
      expect(FeaturedItems.collections).to be_instance_of(Array)
    end

    it 'should return collections as hashes' do
      expect(FeaturedItems.collections).to all(be_instance_of(Hash))
    end

    it 'should have a title for each collection' do
      expect(FeaturedItems.collections).to all(include(:title))
    end

    it 'should have a description for each collection' do
      expect(FeaturedItems.collections).to all(include(:description))
    end

    it 'should have a search query for each collection' do
      expect(FeaturedItems.collections).to all(include(:f))
    end
  end

  describe '.maps' do
    it 'should return an array' do
      expect(FeaturedItems.maps).to be_instance_of(Array)
    end

    it 'should return maps as hashes' do
      expect(FeaturedItems.maps).to all(be_instance_of(Hash))
    end

    it 'should have a title for each map' do
      expect(FeaturedItems.maps).to all(include(:title))
    end

    it 'should have a slug for each map' do
      expect(FeaturedItems.maps).to all(include(:slug))
    end
  end
end
