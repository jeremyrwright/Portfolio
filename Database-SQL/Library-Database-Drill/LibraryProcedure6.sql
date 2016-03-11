USE Library
GO

CREATE PROC FivePlusBooks
AS

SELECT BOR.Name, BOR.Address, COUNT(BL.CardNo) AS BooksCheckedOut
FROM Borrower AS BOR
INNER JOIN Book_Loans AS BL
ON BOR.CardNo = BL.CardNo
GROUP BY BOR.Name, BOR.Address, BL.CardNo
HAVING COUNT(BL.CardNo) > 5
