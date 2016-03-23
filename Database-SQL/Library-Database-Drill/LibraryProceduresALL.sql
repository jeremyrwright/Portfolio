USE Library
GO
---------------------------------
CREATE PROC GetCopiesTitleLibrary @Title varchar(40) = 'The Lost Tribe', @BranchName varchar(30) = 'Sharpstown'
AS

SELECT BC.No_Of_Copies, Book.Title, LB.BranchName
FROM Book
INNER JOIN Book_Copies AS BC
ON Book.BookID = BC.BookID
INNER JOIN Library_Branch AS LB
ON LB.BranchID = BC.BranchID 
Where Title = @Title AND BranchName = @BranchName

---------------------------------
CREATE PROC GetCopiesTitleLibraries @Title varchar(40) = 'The Lost Tribe'
AS

SELECT BC.No_Of_Copies, Book.Title, LB.BranchName
FROM Book
INNER JOIN Book_Copies AS BC
ON Book.BookID = BC.BookID
INNER JOIN Library_Branch AS LB
ON LB.BranchID = BC.BranchID 
Where Title = @Title

---------------------------------
CREATE PROC NoBookBorrowers
AS

SELECT BOR.Name
FROM Borrower AS BOR
LEFT OUTER JOIN Book_Loans AS BL
ON BOR.CardNo = BL.CardNo
WHERE BL.CardNo IS NULL

---------------------------------
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

---------------------------------
CREATE PROC BooksLoanedOut
AS

SELECT LB.BranchName, Count(LB.BranchName) AS BooksLoanedOut
FROM Library_Branch AS LB
INNER JOIN Book_Loans AS BL
ON LB.BranchID = BL.BranchID
GROUP BY LB.BranchName

---------------------------------
CREATE PROC FivePlusBooks
AS

SELECT BOR.Name, BOR.Address, COUNT(BL.CardNo) AS BooksCheckedOut
FROM Borrower AS BOR
INNER JOIN Book_Loans AS BL
ON BOR.CardNo = BL.CardNo
GROUP BY BOR.Name, BOR.Address, BL.CardNo
HAVING COUNT(BL.CardNo) > 5

---------------------------------
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