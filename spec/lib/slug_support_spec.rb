require 'rails_helper'
require 'slug_support'

RSpec.describe SlugSupport, as: :lib do
  describe '#slugify' do
    it 'returns nil if given nil' do
      ss = SlugSupport.new
      expect(ss.slugify(nil)).to be_nil
      expect(ss.slugify('')).to be_nil
    end
  end

  describe '#namify' do
    it 'returns nil if given nil or empty string' do
      ss = SlugSupport.new
      expect(ss.namify(nil)).to be_nil
      expect(ss.namify('')).to be_nil
    end
  end
end
