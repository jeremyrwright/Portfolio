USE Library
GO

CREATE PROC DueToday @BranchName varchar(30) = 'Sharpstown', @DueDate varchar(10) = '2016-03-16'
AS

SELECT Book.Title, BOR.Name, BOR.Address
FROM Book
INNER JOIN Book_Loans AS BL
ON Book.BookID = BL.BookID
INNER JOIN Borrower AS BOR
ON BL.CardNo = BOR.CardNo
INNER JOIN Library_Branch AS LB
ON LB.BranchID = BL.BranchID
Where DueDate = @DueDate AND BranchName = @BranchName