USE Library
GO

CREATE PROC BooksLoanedOut
AS

SELECT LB.BranchName, Count(LB.BranchName) AS BooksLoanedOut
FROM Library_Branch AS LB
INNER JOIN Book_Loans AS BL
ON LB.BranchID = BL.BranchID
GROUP BY LB.BranchName