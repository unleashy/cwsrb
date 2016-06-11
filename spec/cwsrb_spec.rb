# TODO: this whole bullshit

require 'spec_helper'

describe Cwsrb do
  it 'has a version number' do
    expect(Cwsrb::VERSION).not_to be nil
  end
end

describe Cwsrb::Helpers do
  describe '.resolve' do
    context 'with an username' do
      it 'returns a @-prefixed username' do
        expect(Cwsrb::Helpers.resolve('test')).to eq '@test'
        expect(Cwsrb::Helpers.resolve('1test')).to eq '@1test'
        expect(Cwsrb::Helpers.resolve('111')).not_to eq '@111'
        expect(Cwsrb::Helpers.resolve('S111')).not_to eq '@S111'
      end
    end

    context 'with an id' do
      it 'returns the same id' do
        expect(Cwsrb::Helpers.resolve('111')).to eq '111'
        expect(Cwsrb::Helpers.resolve('S111')).to eq 'S111'
        expect(Cwsrb::Helpers.resolve('test')).not_to eq 'test'
        expect(Cwsrb::Helpers.resolve('1test')).not_to eq '1test'
      end
    end
  end
end
