class CashRegister
    attr_reader :discount
    attr_accessor :total, :items
  
    def initialize(employee_discount = 0)
      @total = 0
      @discount = employee_discount
      @items = []
    end
    
    def add_item(title, price, quantity = 1)
      quantity.times { @items << title }
      @total += price * quantity
    end
  
    def apply_discount
      if @discount > 0
        discount_amount = @total * @discount / 100
        @total -= discount_amount
        "After the discount, the total comes to $#{@total}."
      else
        "There is no discount to apply."
      end
    end
    
    def void_last_transaction
      last_item_price = @items.pop
      @total -= last_item_price
      @total = 0 if @items.empty?
    end
  end
  