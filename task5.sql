SELECT suppliers.company_name, products.product_name, products.unit_price FROM products
INNER JOIN suppliers ON suppliers.supplier_id = products.supplier_id
JOIN (SELECT products.supplier_id, MAX(products.unit_price) as max_unit_price FROM products
GROUP BY products.supplier_id) AS temp ON products.supplier_id = temp.supplier_id AND products.unit_price = temp.max_unit_price
ORDER BY unit_price DESC;
