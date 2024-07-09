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

    context 'when given multiple numbers' do
      it 'returns there sum' do
        expect(described_class.add("1,2,3,4,5")).to eq(15)
      end
    end

    context 'when given new line between numbers as delimiter' do
      it 'returns there sum' do
        expect(described_class.add("1\n2,3,4,5")).to eq(15)
      end
    end

    context 'when given different delimiter is used' do
      it 'returns there sum' do
        expect(StringCalculator.add("//;\n1;2;3")).to eq(6)
      end
    end

    context 'when given negative numbers are present' do
      it 'raises an exception' do
        expect { StringCalculator.add("-1") }.to raise_error("negative numbers not allowed -1")
      end

      it 'shows all the numbers in the exception message' do
        expect { StringCalculator.add("-1,2,-3,-4") }.to raise_error("negative numbers not allowed -1, -3, -4")
      end
    end
  end
end
