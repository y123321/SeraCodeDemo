-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE p_SelectTop10Purchases
AS
BEGIN
	waitfor delay '00:00:01'
	SELECT *
    FROM (
        SELECT *, Rank() 
          over (Partition BY ProductID
                ORDER BY LineTotal,PurchaseOrderDetailID DESC ) AS r
        FROM [AdventureWorks2014].[Purchasing].[PurchaseOrderDetail]
        ) rs WHERE r <=10
END