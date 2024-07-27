# frozen_string_literal: true

require_relative 'string_calculator'

RSpec.describe StringCalculator do
  let(:calculator) { StringCalculator.new }

  describe '#add' do
    context 'when input is an empty string' do
      it 'returns 0' do
        expect(calculator.add('')).to eq(0)
      end
    end

    context 'when input is a single number' do
      it 'returns that number' do
        expect(calculator.add('1')).to eq(1)
      end

      it 'returns that number' do
        expect(calculator.add('100')).to eq(100)
      end
    end

    context 'when input has two numbers' do
      it 'returns the sum of those numbers' do
        expect(calculator.add('1,2')).to eq(3)
      end

      it 'returns the sum of those numbers' do
        expect(calculator.add('100,200')).to eq(300)
      end
    end

    context 'when input has multiple numbers' do
      it 'returns the sum of those numbers' do
        expect(calculator.add('1,2,3')).to eq(6)
      end

      it 'returns the sum of those numbers' do
        expect(calculator.add('100,200,300')).to eq(600)
      end

      it 'returns the sum of those numbers with spaces' do
        expect(calculator.add('    100   ,   200    ,     300    ')).to eq(600)
      end
    end

    context 'when numbers are separated by newlines' do
      it 'returns the sum of those numbers' do
        expect(calculator.add("1\n2")).to eq(3)
      end

      it 'returns the sum of those numbers' do
        expect(calculator.add("1\n2,3, 4\n5\n7")).to eq(22)
      end

      it 'raises an error for invalid input' do
        expect { calculator.add("1,\n") }.to raise_error(RuntimeError, 'Invalid input')
      end
    end

    context 'when numbers are separated by different delimiters' do
      it 'returns the sum of those numbers' do
        expect(calculator.add("//;\n1;2")).to eq(3)
      end

      it 'returns the sum of those numbers' do
        expect(calculator.add("//;\n1;2;3;4;5;6")).to eq(21)
      end

      it 'returns the sum of those numbers' do
        expect(calculator.add("//*\n1*2*3")).to eq(6)
      end

      it 'returns the sum of those numbers' do
        expect(calculator.add("//$$\n1$$2$$3")).to eq(6)
      end

      it 'raises an error for invalid input' do
        expect { calculator.add("//$$\n1$$$$2$$3") }.to raise_error(RuntimeError, 'Invalid input')
      end
    end

    context 'when numbers are negative' do
      it 'raise an error for negeive number' do
        expect { calculator.add('-1,2') }.to raise_error(RuntimeError, 'negative numbers not allowed -1')
      end

      it 'raise an error for negeive numbers' do
        expect do
          calculator.add('-1,2,3,4,5,-4,-11')
        end.to raise_error(RuntimeError, 'negative numbers not allowed -1,-4,-11')
      end

      it 'raise an error for Invalid input' do
        expect { calculator.add('-1,2,,12,23,-12') }.to raise_error(RuntimeError, 'Invalid input')
      end
    end
  end
end
