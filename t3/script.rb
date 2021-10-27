class ShopInventory
    @inventory = {}
    def initialize(inventory)
        @inventory = inventory
    end

    def items_in_stock()
        _items = []
        @inventory.each do |item|
            if !item[:quantity_by_size].empty?
                _items.push(item[:name])
            end
        end

        return _items
    end

    def affordable() # Cheaper than 50
        _items = []
        @inventory.each do |item|
            if item[:price] < 50
                _items.push(item)
            end
        end

        return _items
    end

    def out_of_stock()
        _items = []
        @inventory.each do |item|
            if item[:quantity_by_size].empty?
                _items.push(item)
            end
        end

        return _items
    end

    def how_much_left(name)
        _items = []
        @inventory.each do |item|
            if item[:name] == name
                return item[:quantity_by_size]
            end
        end

        return 0;
    end

    def total_stock()
        _count = 0
        @inventory.each do |item|
            if !item[:quantity_by_size].empty?
                item[:quantity_by_size].each_value do |value|
                    _count += value
                end
            end
        end

        return _count
    end
end

inventory = [
    {price: 125.00, name: "Cola", quantity_by_size: {l033: 3, l05: 7, l1: 8, l2: 4}},
    {price: 40.00, name: "Pepsi", quantity_by_size: {}},
    {price: 39.99, name: "Water", quantity_by_size: {l033: 1, l2: 4}},
    {price: 70.00, name: "Juice", quantity_by_size: {l033: 7, l05: 2}}
]

shop_inventory = ShopInventory.new(inventory)
puts("items in stock:", shop_inventory.items_in_stock())
puts
puts("affordable:", shop_inventory.affordable())
puts
puts("out of stock", shop_inventory.out_of_stock())
puts
puts("how_much_left Cola", shop_inventory.how_much_left('Cola'))
puts
puts(shop_inventory.total_stock())