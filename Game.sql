CREATE DATABASE QL_Game
USE QL_Game

CREATE TABLE DoTuoi
(
	MaDoTuoi varchar(10) primary key,
	Tuoi varchar(20)
)

CREATE TABLE KhachHang
(
	MaKH varchar(10) primary key, 
	TenKH nvarchar(50),
	NamSinh int,
	ViKhachHang decimal(10,0) default 0,
	SoDienThoai varchar(11),
	DS_GameMua varchar(600) null
)

CREATE TABLE NgonNgu
(
	MaNN varchar(10) primary key,
	TenNN nvarchar(50),
)

CREATE TABLE NhaPhatTrien
(
	MaNPT varchar(10) primary key,
	TenNPT nvarchar(50),
)


CREATE TABLE TheLoai
(
	MaTheLoai varchar(10) primary key,
	TenTheLoai nvarchar(50)
)

CREATE TABLE Game
(
	MaGame varchar(10) primary key,
	TenGame nvarchar(50),
	NgayRaMat date,
	MoTa nvarchar(200),
	DanhGia int null,
	SoLuong_DG int null,
	Gia decimal(10,0),
	AnhMinhHoa varchar(50),
	LuotTai int default 0 null,
	Hinh1 varchar(50) null,
	Hinh2 varchar(50) null,
	Hinh3 varchar(50) null,
	Hinh4 varchar(50) null,
	MaTheLoai varchar(10),
	MaNPT varchar(10),
	MaDoTuoi varchar(10),
	MaNN varchar(10),
	MaCH varchar(10),
	DS_YeuThich varchar(600) null,
	TenFile varchar(50) 
)

CREATE TABLE HoaDon
(
	MaHD varchar(10) primary key,
	MaGame varchar(10),
	MaKH varchar(10),
	NgayThanhToan date,
)

CREATE TABLE CauHinh
(
	MaCH varchar(10) primary key,
	OSCode varchar(10),
	ProcessorCode varchar(10),
	MemoryCode varchar(10),
	GrapCode varchar(10)
)

CREATE TABLE OS
(
	OSCode varchar(10) primary key,
	OSName nvarchar(50)
)

CREATE TABLE Memory
(
	MemoryCode varchar(10) primary key,
	MemoryName nvarchar(50)
)

CREATE TABLE Processor
(
	ProcessorCode varchar(10) primary key,
	ProcessorName nvarchar(50)
)

CREATE TABLE Graphics
(
	GrapCode varchar(10) primary key,
	GrapName nvarchar(50)
)

ALTER TABLE Game ADD CONSTRAINT FK_MaNN FOREIGN KEY (MaNN) REFERENCES NgonNgu (MaNN)

ALTER TABLE Game ADD CONSTRAINT FK_MaDT FOREIGN KEY (MaDoTuoi) REFERENCES DoTuoi (MaDoTuoi) 

ALTER TABLE Game ADD CONSTRAINT FK_MaNPT FOREIGN KEY (MaNPT) REFERENCES NhaPhatTrien (MaNPT)

ALTER TABLE Game ADD CONSTRAINT FK_MaTL FOREIGN KEY (MaTheLoai) REFERENCES TheLoai (MaTheLoai)

ALTER TABLE Game ADD CONSTRAINT FK_MaCH FOREIGN KEY (MaCH) REFERENCES CauHinh (MaCH) --CHUA NHAP

ALTER TABLE HoaDon ADD CONSTRAINT FK_MaKH FOREIGN KEY (MaKH) REFERENCES KhachHang (MaKH)

ALTER TABLE HoaDon ADD CONSTRAINT FK_MaGame FOREIGN KEY (MaGame) REFERENCES Game (MaGame)


ALTER TABLE CauHinh ADD CONSTRAINT FK_Ma0S FOREIGN KEY (OSCode) REFERENCES OS (OSCode)

ALTER TABLE CauHinh ADD CONSTRAINT FK_ProcessorCode FOREIGN KEY (ProcessorCode) REFERENCES Processor (ProcessorCode)

ALTER TABLE CauHinh ADD CONSTRAINT FK_MemoryCode FOREIGN KEY (MemoryCode) REFERENCES Memory (MemoryCode)

ALTER TABLE CauHinh ADD CONSTRAINT FK_GrapCode FOREIGN KEY (GrapCode) REFERENCES Graphics (GrapCode)

INSERT INTO NgonNgu VALUES
('N001',N'Tiếng Anh'),
('N002',N'Tiếng Pháp'),
('N003',N'Tiếng Hàn'),
('N004',N'Tiếng Nga'),
('N005',N'Tiếng Ý')

INSERT INTO DoTuoi VALUES
('T001','6+'),
('T002','12+'),
('T003','18+')

INSERT INTO NhaPhatTrien VALUES
('NPT01',N'ZeptoLab UK Limited'),
('NPT02',N'King Games'),
('NPT03',N'Tencent'),
('NPT04',N'Hua Weiwei'),
('NPT05',N'F.I.L Games')

INSERT INTO TheLoai VALUES
('TL01',N'Thể thao'),
('TL02',N'Phiêu lưu'),
('TL03',N'Kinh dị'),
('TL04',N'Câu đố, trí tuệ'),
('TL05',N'Đối kháng, Moba')

INSERT INTO Graphics VALUES
('G001',N'Nvidia GeForce GTX'),
('G002',N'AMD Radeon R9 290'),
('G003',N'GeForce GTX 750 Ti'),
('G004',N'Radeon RX 580'),
('G005',N'GeForce GTX 1660 Super')

INSERT INTO OS VALUES
('OS01',N'64-bit Windows 7'),
('OS02',N'Window 8'),
('OS03',N'Window 10'),
('OS04',N'Androi'),
('OS05',N'IOS')

INSERT INTO Processor VALUES
('PS01',N'AMD Ryzen 5'),
('PS02',N'AMD Ryzen 7'),
('PS03',N'Intel Core i9 9900k'),
('PS04',N'Intel Core i5'),
('PS05',N'Intel Core i7')

INSERT INTO Memory VALUES
('M001',N'2GB'),
('M002','3GB'),
('M003','6GB'),
('M004','4GB'),
('M005','8GB')

INSERT INTO CauHinh VALUES
('CH01','OS01','PS01','M001','G001'),
('CH02','OS02','PS05','M002','G003'),
('CH03','OS04','PS02','M005','G004'),
('CH04','OS05','PS03','M003','G005'),
('CH05','OS03','PS04','M004','G002')

INSERT INTO Game VALUES
('G001',N'Chess Free','2009-12-04','...','','',12000,'',0,'','','','','TL01','NPT01','T001','N001','CH01','',''), 
('G002',N'Free Fire','2009-12-12','...','','',13000,'',0,'','','','','TL02','NPT02','T001','N001','CH01','',''), 
('G003',N'Fifa Online 4','2009-12-02','...','','',14000,'',0,'','','','','TL01','NPT03','T001','N001','CH01','',''), 
('G004',N'Cầu lông','2009-12-06','...','','',15000,'',0,'','','','','TL03','NPT04','T001','N001','CH01','',''), 
('G005',N'Pes 2021','2009-12-08','...','','',16000,'',0,'','','','','TL04','NPT01','T001','N001','CH01','','') 


INSERT INTO KhachHang VALUES
('KH01',N'Lê Trọng Kha',2000,0,'0125672630',''),
('KH02',N'Nguyễn Công Đoan',2001,0,'0582958275',''),
('KH03',N'Nguyễn Hữu Vinh Quang',2002,0,'0758463728',''),
('KH04',N'Nguyễn Tấn Phát',2009,0,'0985647381',''),
('KH05',N'Thái Thành Luân',2005,0,'0581625385','')

CREATE TABLE HoaDon
(
	MaHD varchar(10) primary key,
	MaGame varchar(10),
	MaKH varchar(10),
	NgayThanhToan date,
)

INSERT INTO HoaDon VALUES
('HD01','G001','KH01','2021-04-12'),
('HD0','G002','KH02','2021-04-13'),
('HD03','G003','KH05','2021-06-02'),
('HD04','G004','KH04','2021-05-10'),
('HD05','G005','KH03','2021-08-11')



