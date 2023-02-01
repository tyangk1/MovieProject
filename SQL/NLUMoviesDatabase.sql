CREATE DATABASE NLUMOVIES_DATABASE
USE NLUMOVIES_DATABASE

CREATE TABLE About (
	AboutID INT IDENTITY(1,1) primary key,
	Name nvarchar(120),
	Image nvarchar(120),
	Description nvarchar(500),
	CreatedDate datetime,
	CreatedBy nvarchar(120),
	ModifiedDate datetime,
	ModifiedBy nvarchar(120),
	MetaKeywords nvarchar(500),
	Status bit 
);
CREATE TABLE Ads(
AdsID int IDENTITY(1,1) primary key,
NameAds nvarchar(120),
ImageAds nvarchar(120),
UrlAds nvarchar(120),
CreatedDate datetime,
CreatedBy nvarchar(120),
ModifiedDate datetime,
ModifiedBy nvarchar(120),
MetaKeywords nvarchar(120),
MetaDescriptions nvarchar(500),
Status bit
);
CREATE TABLE Category(
CategoryID int IDENTITY(1,1) primary key,
NameCategory nvarchar(120),
CreatedDate datetime,
CreatedBy nvarchar(120),
ModifiedDate datetime,
ModifiedBy nvarchar(120),
MetaKeywords nvarchar(120),
MetaDescriptions nvarchar(500),
Status bit,
ParentID int , 
DisplayOrder int,
SeoTittle nvarchar(500) 
);
CREATE TABLE Trailer(
TrailerID int IDENTITY(1,1) primary key,
Name nvarchar(120),
Image nvarchar(120),
Url nvarchar(120),
CreatedDate datetime,
CreatedBy nvarchar(120),
ModifiedDate datetime,
ModifiedBy nvarchar(120),
Status bit
);
CREATE TABLE UserGroup(
ID nvarchar(120)  primary key,
Name nvarchar(120)
);
CREATE TABLE Permission(
ID int  primary key,
Name nvarchar(120)
);
CREATE TABLE dbo.[User](
UserID int IDENTITY(1,1) primary key,
Name nvarchar(120),
UserName nvarchar(120),
Password nvarchar(120),
PermissionID int REFERENCES Permission(ID),
CreatedDate datetime,
CreatedBy nvarchar(120),
ModifiedDate datetime,
ModifiedBy nvarchar(120),
Status bit,
Phone nvarchar(120),
Email nvarchar(500),
GroupID nvarchar(120) REFERENCES UserGroup(ID)
);
CREATE TABLE Role(
ID nvarchar(120) primary key, 
Name nvarchar(120)
);
CREATE TABLE Country(
CountryID int IDENTITY(1,1) primary key, 
Name nvarchar(120),
CreatedDate datetime,
Status bit
);
CREATE TABLE Movie(
MovieID int IDENTITY(1,1) primary key,
Name nvarchar(120),
Image nvarchar(120),
MoreImages nvarchar(120),
Actor nvarchar(120),
Description nvarchar(500),
Directors nvarchar(120),
Time nvarchar(120),
Year int,
Country nvarchar(120),
MovieLink nvarchar(120),
TrailerLink nvarchar(120),
CategoryID int REFERENCES Category(CategoryID),
Rate int,
TrailerID int REFERENCES Trailer(TrailerID),
Viewed int,
CreatedDate datetime,
CreatedBy nvarchar(120),
ModifiedDate datetime,
ModifiedBy nvarchar(120),
MetaKeywords nvarchar(120),
MetaDescriptions nvarchar(500),
Status bit,
TopHot datetime,
CountryID int REFERENCES Country(CountryID)
);
CREATE TABLE Comments(
CommentID int IDENTITY(1,1) primary key,
MovieID int REFERENCES Movie(MovieID),
Name nvarchar(500),
Content nvarchar(120),
UserID int REFERENCES dbo.[User](UserID),
CreatedDate datetime,
CreatedBy nvarchar(120),
ModifiedDate datetime,
ModifiedBy nvarchar(120),
MetaKeywords nvarchar(120),
MetaDescriptions nvarchar(500),
Status bit
);
CREATE TABLE Contact(
ID int IDENTITY(1,1) primary key,
Content nvarchar(500),
Status bit
);

CREATE TABLE Credential(
UserGroupID nvarchar(120) REFERENCES UserGroup(ID),
RoleID nvarchar(120) REFERENCES Role(ID)
);
CREATE TABLE FeedBack(
ID int IDENTITY(1,1) primary key,
Name nvarchar(120),
Phone nvarchar(120),
Email nvarchar(120),
Content nvarchar(500),
Address nvarchar(120),
CreatedDate datetime,
Status bit
);

CREATE TABLE News(
NewsID int IDENTITY(1,1) primary key,
Name nvarchar(120),
Image nvarchar(120),
Description nvarchar(500),
Year int,
Country nvarchar(120),
MovieLink nvarchar(120),
TrailerLink nvarchar(120),
CategoryID int REFERENCES Category(CategoryID),
Rate int,
TrailerID int REFERENCES Trailer(TrailerID),
Viewed int,
CreatedDate datetime,
CreatedBy nvarchar(120),
ModifiedDate datetime,
ModifiedBy nvarchar(120),
MetaKeywords nvarchar(120),
MetaDescriptions nvarchar(500),
Status bit,
TopHot datetime,
Tags	nvarchar(120),
ImageNews nvarchar(120),
MoreDescription nvarchar(500)
);


CREATE TABLE Slide(
SlideID int IDENTITY(1,1) primary key,
Name nvarchar(800),
Description nvarchar(500),
Image nvarchar(120),
Url nvarchar(120),
CreatedDate datetime,
CreatedBy nvarchar(120),
ModifiedDate datetime,
ModifiedBy nvarchar(120),
Status bit
);
INSERT INTO USERGROUP VALUES('MEMBER',N'Thành viên'),('MOD','Moderatior'),('ADMIN',N'Quản trị')
INSERT INTO ROLE VALUES('ADD_USER',N'Thêm User'),('DELETE_USER',N'Xóa User'),('EDIT_USER',N'Sửa User'),('VIEW_USER',N'Xem danh sách')
INSERT INTO PERMISSION VALUES(1,'admin'),(4,'user')
ALTER TABLE ABOUT
ADD MetaDescriptions nvarchar(120)
ALTER TABLE ABOUT
ALTER COLUMN DESCRIPTION NVARCHAR(max)
ALTER TABLE Movie
ALTER COLUMN DESCRIPTION NVARCHAR(max)
INSERT INTO dbo.[USER] VALUES ('Kang','admin','21232f297a57a5a743894a0e4a801fc3',1,'2022-5-10 1:46:44.253',null,null,null,1,'0349677839','ndkhang.itnlu@gmail.com','ADMIN')
INSERT INTO dbo.[USER] VALUES ('Kun','Kang','21232f297a57a5a743894a0e4a801fc3',1,'2022-5-9 1:46:34.253',null,null,null,1,'0349677639','ndkhang.iitnlu@gmail.com','ADMIN') 