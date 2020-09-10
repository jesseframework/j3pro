SELECT * 
FROM item_pricing_rule
WHERE 
(((apply_on = 'Item Code' AND item_code = 'ItemName') AND min_quantity <= 'numOfItemOnRegister') 
OR apply_on = 'Item Group' AND item_group = 'getItemGroup' AND min_quantity <= 'numOfItemGroupOnRegister'
OR apply_on = 'Item Group' AND item_group = 'All Item Groups' AND min_quantity <= 'numOfAllItemsOnRegister'
OR apply_on = 'category' AND category = 'getCategory' AND min_quantity <= 'numOfcategoryOnRegister'
OR applicable_for = 'Customer Group' AND customer_group = 'customerGroup'
OR applicable_for = 'Customer' AND customer_name = 'SeclectCustomer'
OR applicable_for = 'Territory' AND customer_territory = 'salesTerritory'
OR applicable_for = 'Sales Partner' AND parent_group = 'salesPartner'
AND price_list_name = 'Standard Selling' 
AND valid_from <= '2020-10-10'
AND valid_to >= '2020-09-09'
AND is_active == true)

 