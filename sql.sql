-- Selecting data from tables
SELECT * FROM tblProducts;
SELECT * FROM tblProductiondetails;

-- Inserting data into tblProducts
INSERT INTO tblProducts (ProductName)
VALUES 
('Electric Fan'),
('Microwave Oven'),
('Refrigerator'),
('Washing Machine'),
('LED TV');

-- Inserting data into tblProductionDetails
INSERT INTO tblProductionDetails (Productiondate, ProductQuantity)
VALUES 
('2024-08-25', 150),
('2024-08-26', 200),
('2024-08-27', 180),
('2024-08-28', 220),
('2024-08-29', 170);

-- Additional records for 2023
INSERT INTO tblProductionDetails (Productiondate, ProductQuantity)
VALUES 
('2023-08-25', 150),
('2023-08-26', 200),
('2023-08-27', 180),
('2023-08-28', 220),
('2023-08-29', 170);

-- Stored Procedure to get product names
CREATE PROCEDURE usp_GetProductName
AS
BEGIN
    SELECT ProductName FROM tblProducts;
END;

-- Stored Procedure to get distinct production dates
CREATE PROCEDURE USP_GetDate
AS
BEGIN
    SELECT DISTINCT ProductionDate FROM tblProductionDetails;
END;

-- Stored Procedure to get product quantity based on the production date
CREATE PROCEDURE USP_GetProductQuantity
    @ProductionDate DATE
AS
BEGIN
    SELECT ProductQuantity 
    FROM tblProductionDetails
    WHERE ProductionDate = @ProductionDate;
END;


CREATE PROCEDURE USP_GetProductQuantityByDate
@ProductionDate DATE = NULL
AS
BEGIN
    SELECT P.ProductName, D.ProductQuantity 
    FROM tblProducts P
    JOIN tblProductionDetails D ON P.ProductID = D.ProductID
    WHERE D.ProductionDate = @ProductionDate;
END;


CREATE PROCEDURE USP_GetDistinctProductionDates
AS
BEGIN
    SELECT DISTINCT ProductionDate 
    FROM tblProductionDetails;
END;
