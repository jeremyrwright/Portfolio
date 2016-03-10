USE Library
GO

CREATE PROC GetCopiesTitleLibraries @Title varchar(40) = 'The Lost Tribe'
AS

SELECT BC.No_Of_Copies, Book.Title, LB.BranchName
FROM Book
INNER JOIN Book_Copies AS BC
ON Book.BookID = BC.BookID
INNER JOIN Library_Branch AS LB
ON LB.BranchID = BC.BranchID 
Where Title = @Title
