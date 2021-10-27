## class ShopInventory

### Fields
**inventory** - contains actual array inventory in this format:
```
[
    {price:, name:, quantity_by_size: {size:}}
]
```

### Methods

**items_in_stock** - returns all item NAMES in stock only, sorted alphabetically.
**affordable** - returns all items (full hashes) for “afforbadle” items cheaper than 50.
**out_of_stock** - returns all items out of stock.
**how_much_left** - returns how much in stock of an item is left by its name.
**total_stock** - returns total amount of all items in stock for all variants.
