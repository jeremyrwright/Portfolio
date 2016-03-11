USE Library
GO

CREATE PROC Author @AuthorName varchar(40) = 'Stephen King', @BranchName varchar(30) = 'Central'
AS

SELECT BA.AuthorName, BC.No_Of_Copies, LB.BranchName
FROM Book
INNER JOIN Book_Authors AS BA
ON Book.BookID = BA.BookID
INNER JOIN Book_Copies AS BC
ON Book.BookID = BC.BookID
INNER JOIN Library_Branch AS LB
ON BC.BranchID = LB.BranchID
Where AuthorName = @AuthorName AND BranchName = @BranchName
