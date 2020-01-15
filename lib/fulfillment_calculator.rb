# Fulfillment calculation assumes the following interface for order data:

# {
#   type: String,
#   cash: Integer,
#   price: Integer,
#   bonus_ratio: Integer
# }

class FulfillmentCalculator
  attr_reader :order

  def initialize(order)
    @order = order
  end

  def fulfillments
    @fulfillments ||= calculate_fulfillments
  end

  def purchase_quantity
    order[:cash] / order[:price]
  end

  def bonus_multiplier
    purchase_quantity / order[:bonus_ratio]
  end

  def bonus_items
    bonus_ruleset_key = order[:type].to_sym
    bonus_ruleset[bonus_ruleset_key].transform_values { |value| value * bonus_multiplier }
  end

  def bonus_ruleset
    {
      dark: {
        dark: 2
      },
      milk: {
        milk: 1
      },
      white: {
        milk: 1,
        white: 1
      }
    }
  end

  private

  def calculate_fulfillments
    itemization = { milk: 0, dark: 0, white: 0 }
    itemization[:"#{order[:type]}"] = purchase_quantity
    bonus_items.each { |key, value| itemization[key] += value }
    itemization
  end
end