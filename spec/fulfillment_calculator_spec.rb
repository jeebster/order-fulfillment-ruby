describe FulfillmentCalculator do
  let(:calculator) { described_class.new(order) }
  let(:order) do
    {
      type: 'milk',
      cash: 12,
      price: 2,
      bonus_ratio: 5
    }
  end

  describe '#purchase_quantity' do
    subject { calculator.purchase_quantity }

    it 'should calculate the quantity of items a user can purchase' do
      calculation = order[:cash] / order[:price]
      expect(subject).to eq(calculation)
    end
  end

  describe '#bonus_multiplier' do
    subject { calculator.bonus_multiplier }

    it 'should calculate the multiplier to be applied to the bonus items ruleset' do
      calculation = calculator.purchase_quantity / order[:bonus_ratio]
      expect(subject).to eq(calculation)
    end
  end

  describe '#bonus_items' do
    subject { calculator.bonus_items }
    let(:keys) { subject.keys }

    context 'order item type' do
      context 'when dark' do
        before { order[:type] = 'dark' }

        it 'should only return dark item types' do
          expect(keys.size).to eq(1)
          expect(keys).to include(:dark)
        end
      end

      context 'when milk' do
        it 'should only return milk item types' do
          expect(keys.size).to eq(1)
          expect(keys).to include(:milk)
        end
      end

      context 'when white' do
        before { order[:type] = 'white' }

        it 'should only return milk and white item types' do
          expect(subject.keys.size).to eq(2)
          %i(milk white).each do |key|
            expect(subject.keys).to include(key)
          end
        end
      end
    end

    it 'should return the number and type of bonus items to be applied to the fulfillments' do
      symbolized_order_type = order[:type].to_sym
      calculation = calculator.bonus_ruleset[symbolized_order_type]
                              .transform_values { |value| value * calculator.bonus_multiplier }

      expect(subject).to eq(calculation)
    end
  end

  describe '#fulfillments' do
    subject { calculator.fulfillments }

    context 'schema' do
      it 'should contain valid keys' do
        %i(dark milk white).each do |key|
          expect(subject.keys).to include(key)
        end
      end
    end

    context 'order item type' do
      context 'when dark' do
        before { order[:type] = 'dark' }

        it 'should equal bonus_items + purchase_quantity' do
          # TODO: Implementation (time constraint)
        end
      end

      context 'milk' do
        it 'should equal bonus items + purchase quantity' do
          # TODO: Implementation (time constraint)
        end
      end

      context 'white' do
        before { order[:type] = 'white' }

        it 'should equal bonus items + purchase quantity' do
          # TODO: Implementation (time constraint)
        end
      end
    end
  end
end