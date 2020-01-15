describe FulfillmentProcessor do
  describe '#execute' do
    subject { described_class.new(order_data).execute }

    let(:order_data) { ['milk', 12, 2, 5] }
    let(:fulfillment_calculator) { FulfillmentCalculator.new(order_data) }

    it 'should calculate fulfillment values' do
      expect_any_instance_of(FulfillmentProcessor).to receive(:execute)
      subject
    end

    it 'should return a formatted string' do
      expect(subject).to be_a(String)
      # TODO: Implementation (time constraint)
    end
  end
end