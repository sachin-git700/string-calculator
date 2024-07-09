require 'rspec'
require_relative '../main'

RSpec.describe StringCalculator do
  describe '.add' do
    context 'when given an empty string' do
      it 'returns 0' do
        expect(described_class.add("")).to eq(0)
      end
    end

    context 'when given a single number' do
      it 'returns the number' do
        expect(described_class.add("1")).to eq(1)
      end
    end

    context 'when given two numbers' do
      it 'returns there sum' do
        expect(described_class.add("1,2")).to eq(3)
      end
    end
  end
end
