Answers:

1.
SELECT 
    p.prod_name,
    COALESCE(SUM(o.qty), 0) AS total_quantity
FROM Tbl_Products p
LEFT JOIN Tbl_Orders o 
    ON p.prod_id = o.prod_id
GROUP BY p.prod_name;

2.
CREATE OR REPLACE FUNCTION check_stock()
RETURNS TRIGGER AS $$
DECLARE
    available_stock INT;
BEGIN
    SELECT stock_qty INTO available_stock
    FROM Tbl_Products
    WHERE prod_id = NEW.prod_id;

    IF NEW.qty > available_stock THEN
        RAISE EXCEPTION 'Order quantity exceeds available stock';
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_check_stock
BEFORE INSERT ON Tbl_Orders
FOR EACH ROW
EXECUTE FUNCTION check_stock();


