class CashRegister

attr_accessor :total, :discount, :item_array, :price_array 

    def initialize(discount=0)
        @total = 0
        @discount = discount
        @item_array = []
        @price_array = []

    end

    def total
        @total
    end

    def add_item(title, price, quantity = 1)
        quantity.times { @item_array << title}
        quantity.times { @price_array << price*quantity}
        subtotal = price * quantity
        self.total = @total + subtotal
        self.items
    end

    def apply_discount
        if @discount == 0
            "There is no discount to apply."
        else
            d = @discount.to_f
            multiplier = 1 - d/100
            self.total = @total.to_f * multiplier
            "After the discount, the total comes to $#{@total.to_i}."
        end
    end


    def items()
        @item_array
    end

    def void_last_transaction
        
        @total -= @price_array[-1]
        @price_array.pop
       puts @total
    end

end

order1 = CashRegister.new(10)
order1.add_item("cat", 100)
puts order1.total


