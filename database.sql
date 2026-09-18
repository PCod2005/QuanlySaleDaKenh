-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: cnj11_fashion_pos
-- ------------------------------------------------------
-- Server version	8.0.39

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `chi_tiet_don_hang`
--

DROP TABLE IF EXISTS `chi_tiet_don_hang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chi_tiet_don_hang` (
  `maDH` int NOT NULL,
  `maSP` int NOT NULL,
  `soLuong` int NOT NULL,
  `giaBan` decimal(15,2) NOT NULL,
  `thanhTien` decimal(15,2) NOT NULL,
  PRIMARY KEY (`maDH`,`maSP`),
  KEY `maSP` (`maSP`),
  CONSTRAINT `chi_tiet_don_hang_ibfk_1` FOREIGN KEY (`maDH`) REFERENCES `don_hang` (`maDH`) ON DELETE CASCADE,
  CONSTRAINT `chi_tiet_don_hang_ibfk_2` FOREIGN KEY (`maSP`) REFERENCES `san_pham` (`maSP`) ON DELETE RESTRICT,
  CONSTRAINT `chi_tiet_don_hang_chk_1` CHECK ((`soLuong` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chi_tiet_don_hang`
--

LOCK TABLES `chi_tiet_don_hang` WRITE;
/*!40000 ALTER TABLE `chi_tiet_don_hang` DISABLE KEYS */;
/*!40000 ALTER TABLE `chi_tiet_don_hang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chi_tiet_phieu_nhap`
--

DROP TABLE IF EXISTS `chi_tiet_phieu_nhap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chi_tiet_phieu_nhap` (
  `maPN` int NOT NULL,
  `maSP` int NOT NULL,
  `soLuong` int NOT NULL,
  `giaNhap` decimal(15,2) NOT NULL,
  `thanhTien` decimal(15,2) NOT NULL,
  PRIMARY KEY (`maPN`,`maSP`),
  KEY `maSP` (`maSP`),
  CONSTRAINT `chi_tiet_phieu_nhap_ibfk_1` FOREIGN KEY (`maPN`) REFERENCES `phieu_nhap` (`maPN`) ON DELETE CASCADE,
  CONSTRAINT `chi_tiet_phieu_nhap_ibfk_2` FOREIGN KEY (`maSP`) REFERENCES `san_pham` (`maSP`) ON DELETE RESTRICT,
  CONSTRAINT `chi_tiet_phieu_nhap_chk_1` CHECK ((`soLuong` > 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chi_tiet_phieu_nhap`
--

LOCK TABLES `chi_tiet_phieu_nhap` WRITE;
/*!40000 ALTER TABLE `chi_tiet_phieu_nhap` DISABLE KEYS */;
INSERT INTO `chi_tiet_phieu_nhap` VALUES (1,71,10,150000.00,1500000.00),(1,72,10,150000.00,1500000.00),(1,73,10,150000.00,1500000.00),(2,69,10,120000.00,1200000.00),(3,64,10,280000.00,2800000.00),(3,65,10,280000.00,2800000.00),(3,66,10,280000.00,2800000.00),(4,70,10,180000.00,1800000.00),(5,67,10,800000.00,8000000.00),(5,68,5,850000.00,4250000.00);
/*!40000 ALTER TABLE `chi_tiet_phieu_nhap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `danh_muc`
--

DROP TABLE IF EXISTS `danh_muc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `danh_muc` (
  `maDM` int NOT NULL AUTO_INCREMENT,
  `tenDM` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `moTa` text COLLATE utf8mb4_unicode_ci,
  `trangThai` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`maDM`),
  UNIQUE KEY `tenDM` (`tenDM`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `danh_muc`
--

LOCK TABLES `danh_muc` WRITE;
/*!40000 ALTER TABLE `danh_muc` DISABLE KEYS */;
INSERT INTO `danh_muc` VALUES (1,'Áo Nam','Các loại áo thun, sơ mi, khoác nam',1),(2,'Quần Nam','Quần jean, âu, short nam',1),(3,'Áo Nữ','Áo croptop, áo kiểu, áo thun nữ',1),(4,'Quần Nữ','Quần ống rộng, chân váy, jean nữ',1),(5,'Giày Dép','Sneaker, giày da, cao gót',1),(6,'Phụ Kiện','Đồng hồ, túi, ví, thắt lưng, kính',1);
/*!40000 ALTER TABLE `danh_muc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `don_hang`
--

DROP TABLE IF EXISTS `don_hang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `don_hang` (
  `maDH` int NOT NULL AUTO_INCREMENT,
  `maNV` int NOT NULL,
  `ngayLap` datetime DEFAULT CURRENT_TIMESTAMP,
  `tenKhachHang` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `soDienThoaiKhachHang` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `diaChiKhachHang` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kenhBan` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `maPTTT` int NOT NULL,
  `tongTien` decimal(15,2) NOT NULL DEFAULT '0.00',
  `trangThai` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Mới tạo',
  `ghiChu` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`maDH`),
  KEY `maNV` (`maNV`),
  KEY `maPTTT` (`maPTTT`),
  CONSTRAINT `don_hang_ibfk_1` FOREIGN KEY (`maNV`) REFERENCES `nguoi_dung` (`maNV`) ON DELETE RESTRICT,
  CONSTRAINT `don_hang_ibfk_2` FOREIGN KEY (`maPTTT`) REFERENCES `phuong_thuc_thanh_toan` (`maPTTT`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `don_hang`
--

LOCK TABLES `don_hang` WRITE;
/*!40000 ALTER TABLE `don_hang` DISABLE KEYS */;
/*!40000 ALTER TABLE `don_hang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lich_su_hoat_dong`
--

DROP TABLE IF EXISTS `lich_su_hoat_dong`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lich_su_hoat_dong` (
  `maLog` int NOT NULL AUTO_INCREMENT,
  `maNV` int DEFAULT NULL,
  `hanhDong` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `chiTiet` text COLLATE utf8mb4_unicode_ci,
  `thoiGian` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`maLog`),
  KEY `maNV` (`maNV`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lich_su_hoat_dong`
--

LOCK TABLES `lich_su_hoat_dong` WRITE;
/*!40000 ALTER TABLE `lich_su_hoat_dong` DISABLE KEYS */;
INSERT INTO `lich_su_hoat_dong` VALUES (11,1,'Sửa Danh Mục','Cập nhật mã DM: 6 (Phụ Kiện)','2026-09-14 14:07:32'),(12,1,'Sửa Danh Mục','Cập nhật mã DM: 6 (Phụ Kiện)','2026-09-14 14:07:45'),(13,1,'Nhập Kho','Lập phiếu nhập #PN0005 - Tổng tiền: 12.250.000 ₫','2026-09-14 14:08:28');
/*!40000 ALTER TABLE `lich_su_hoat_dong` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nguoi_dung`
--

DROP TABLE IF EXISTS `nguoi_dung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nguoi_dung` (
  `maNV` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hoTen` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sdt` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` enum('ADMIN','STAFF') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'STAFF',
  `trangThai` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`maNV`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nguoi_dung`
--

LOCK TABLES `nguoi_dung` WRITE;
/*!40000 ALTER TABLE `nguoi_dung` DISABLE KEYS */;
INSERT INTO `nguoi_dung` VALUES (1,'admin','$2a$10$/BFa3GgxVy1hUIvdLLFRguFglS0mB9xjoJ5Lw2PdJU6drfanBY/yu','Quản Trị Viên','0987654321','admin@cnj11.com','ADMIN',1),(2,'staff1','$2a$10$/BFa3GgxVy1hUIvdLLFRguFglS0mB9xjoJ5Lw2PdJU6drfanBY/yu','Nhân Viên Bán Hàng 1','0909090909','staff1@cnj11.com','STAFF',1);
/*!40000 ALTER TABLE `nguoi_dung` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nhan_vien`
--

DROP TABLE IF EXISTS `nhan_vien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nhan_vien` (
  `maNV` int NOT NULL AUTO_INCREMENT,
  `tenDangNhap` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `matKhau` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hoTen` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dienThoai` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT 'STAFF',
  `trangThai` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`maNV`),
  UNIQUE KEY `tenDangNhap` (`tenDangNhap`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nhan_vien`
--

LOCK TABLES `nhan_vien` WRITE;
/*!40000 ALTER TABLE `nhan_vien` DISABLE KEYS */;
/*!40000 ALTER TABLE `nhan_vien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phieu_nhap`
--

DROP TABLE IF EXISTS `phieu_nhap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phieu_nhap` (
  `maPN` int NOT NULL AUTO_INCREMENT,
  `maNV` int NOT NULL,
  `ngayNhap` datetime DEFAULT CURRENT_TIMESTAMP,
  `tongTien` decimal(15,2) NOT NULL DEFAULT '0.00',
  `ghiChu` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`maPN`),
  KEY `maNV` (`maNV`),
  CONSTRAINT `phieu_nhap_ibfk_1` FOREIGN KEY (`maNV`) REFERENCES `nguoi_dung` (`maNV`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phieu_nhap`
--

LOCK TABLES `phieu_nhap` WRITE;
/*!40000 ALTER TABLE `phieu_nhap` DISABLE KEYS */;
INSERT INTO `phieu_nhap` VALUES (1,1,'2026-09-14 03:10:34',4500000.00,'Amelia Roadter '),(2,1,'2026-09-14 03:18:15',1200000.00,'Diamond Z'),(3,1,'2026-09-14 13:33:07',8400000.00,'Gucci'),(4,1,'2026-09-14 13:44:56',1800000.00,''),(5,1,'2026-09-14 14:08:28',12250000.00,'LV');
/*!40000 ALTER TABLE `phieu_nhap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phuong_thuc_thanh_toan`
--

DROP TABLE IF EXISTS `phuong_thuc_thanh_toan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phuong_thuc_thanh_toan` (
  `maPTTT` int NOT NULL AUTO_INCREMENT,
  `tenPTTT` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `trangThai` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`maPTTT`),
  UNIQUE KEY `tenPTTT` (`tenPTTT`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phuong_thuc_thanh_toan`
--

LOCK TABLES `phuong_thuc_thanh_toan` WRITE;
/*!40000 ALTER TABLE `phuong_thuc_thanh_toan` DISABLE KEYS */;
INSERT INTO `phuong_thuc_thanh_toan` VALUES (1,'Tiền mặt',1),(2,'Chuyển khoản',1);
/*!40000 ALTER TABLE `phuong_thuc_thanh_toan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `san_pham`
--

DROP TABLE IF EXISTS `san_pham`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `san_pham` (
  `maSP` int NOT NULL AUTO_INCREMENT,
  `maDM` int NOT NULL,
  `tenSP` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `giaNhap` decimal(15,2) NOT NULL,
  `giaBan` decimal(15,2) NOT NULL,
  `soLuongTon` int NOT NULL DEFAULT '0',
  `moTa` text COLLATE utf8mb4_unicode_ci,
  `anh` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `trangThai` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`maSP`),
  UNIQUE KEY `tenSP` (`tenSP`),
  KEY `maDM` (`maDM`),
  CONSTRAINT `san_pham_ibfk_1` FOREIGN KEY (`maDM`) REFERENCES `danh_muc` (`maDM`) ON DELETE RESTRICT,
  CONSTRAINT `san_pham_chk_1` CHECK ((`giaNhap` > 0)),
  CONSTRAINT `san_pham_chk_2` CHECK ((`giaBan` > 0)),
  CONSTRAINT `san_pham_chk_3` CHECK ((`soLuongTon` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `san_pham`
--

LOCK TABLES `san_pham` WRITE;
/*!40000 ALTER TABLE `san_pham` DISABLE KEYS */;
INSERT INTO `san_pham` VALUES (1,1,'Áo Polo Basic - Trắng - Size S',150000.00,250000.00,0,'Cotton 100%','https://images.unsplash.com/photo-1581655353564-df123a1eb820?w=300&q=80',1),(2,1,'Áo Polo Basic - Đen - Size S',150000.00,250000.00,0,'Cotton 100%','https://images.unsplash.com/photo-1581655353564-df123a1eb820?w=300&q=80',1),(3,1,'Áo Thun Graphic - Be - Size S',120000.00,199000.00,0,'In họa tiết','https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=300&q=80',1),(4,1,'Áo Khoác Bomber - Rêu - Size S',280000.00,490000.00,0,'Chống nước','https://images.unsplash.com/photo-1591047139829-d91aecb6caea?w=300&q=80',1),(5,1,'Áo Polo Basic - Trắng - Size M',150000.00,250000.00,0,'Cotton 100%','https://images.unsplash.com/photo-1581655353564-df123a1eb820?w=300&q=80',1),(6,1,'Áo Polo Basic - Đen - Size M',150000.00,250000.00,0,'Cotton 100%','https://images.unsplash.com/photo-1581655353564-df123a1eb820?w=300&q=80',1),(7,1,'Áo Thun Graphic - Be - Size M',120000.00,199000.00,0,'In họa tiết','https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=300&q=80',1),(8,1,'Áo Khoác Bomber - Rêu - Size M',280000.00,490000.00,0,'Chống nước','https://images.unsplash.com/photo-1591047139829-d91aecb6caea?w=300&q=80',1),(9,1,'Áo Polo Basic - Trắng - Size L',150000.00,250000.00,0,'Cotton 100%','https://images.unsplash.com/photo-1581655353564-df123a1eb820?w=300&q=80',1),(10,1,'Áo Polo Basic - Đen - Size L',150000.00,250000.00,0,'Cotton 100%','https://images.unsplash.com/photo-1581655353564-df123a1eb820?w=300&q=80',1),(11,1,'Áo Thun Graphic - Be - Size L',120000.00,199000.00,0,'In họa tiết','https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=300&q=80',1),(12,1,'Áo Khoác Bomber - Rêu - Size L',280000.00,490000.00,0,'Chống nước','https://images.unsplash.com/photo-1591047139829-d91aecb6caea?w=300&q=80',1),(13,1,'Áo Polo Basic - Trắng - Size XL',150000.00,250000.00,0,'Cotton 100%','https://images.unsplash.com/photo-1581655353564-df123a1eb820?w=300&q=80',1),(14,1,'Áo Polo Basic - Đen - Size XL',150000.00,250000.00,0,'Cotton 100%','https://images.unsplash.com/photo-1581655353564-df123a1eb820?w=300&q=80',1),(15,1,'Áo Thun Graphic - Be - Size XL',120000.00,199000.00,0,'In họa tiết','https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=300&q=80',1),(16,1,'Áo Khoác Bomber - Rêu - Size XL',280000.00,490000.00,0,'Chống nước','https://images.unsplash.com/photo-1591047139829-d91aecb6caea?w=300&q=80',1),(17,1,'Áo Sơ Mi Oxford - Xanh Nhạt - Size M',180000.00,320000.00,0,'Vải lụa nến ít nhăn','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRYx_rGXSRVMXqpfpXyHFAuLj6VHaMvMn1eTK1rFBBB3qx2udUrg8oNlIA&s=10',1),(18,1,'Áo Sơ Mi Oxford - Xanh Nhạt - Size L',180000.00,320000.00,0,'Vải lụa nến ít nhăn','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRYx_rGXSRVMXqpfpXyHFAuLj6VHaMvMn1eTK1rFBBB3qx2udUrg8oNlIA&s=10',1),(19,1,'Áo Sơ Mi Oxford - Xanh Nhạt - Size XL',180000.00,320000.00,0,'Vải lụa nến ít nhăn','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRYx_rGXSRVMXqpfpXyHFAuLj6VHaMvMn1eTK1rFBBB3qx2udUrg8oNlIA&s=10',1),(20,1,'Áo Sơ Mi Oxford - Xanh Nhạt - Size XXL',180000.00,320000.00,0,'Vải lụa nến ít nhăn','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRYx_rGXSRVMXqpfpXyHFAuLj6VHaMvMn1eTK1rFBBB3qx2udUrg8oNlIA&s=10',1),(21,2,'Quần Jean Slimfit - Xanh - Size 29',200000.00,380000.00,0,'Co giãn tốt','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSm1TrtaluO2tslZ16Ui5Pep88I6BBqPSxwoozC1arOmyegqco5pr_ahSD0&s=10',1),(22,2,'Quần Jean Slimfit - Đen - Size 29',200000.00,380000.00,0,'Co giãn tốt','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSm1TrtaluO2tslZ16Ui5Pep88I6BBqPSxwoozC1arOmyegqco5pr_ahSD0&s=10',1),(23,2,'Quần Tây Âu - Đen - Size 29',220000.00,420000.00,0,'Dáng ôm vừa','https://4menshop.com/cache/image/300x400/images/thumbs/2025/04/quan-tay-phoi-day-soc-o-tui-sau-form-slimfit-qt066_small-19209.jpg',1),(24,2,'Quần Short Khaki - Kem - Size 29',140000.00,250000.00,0,'Thoáng mát','https://images.unsplash.com/photo-1591195853828-11db59a44f6b?w=300&q=80',1),(25,2,'Quần Jean Slimfit - Xanh - Size 30',200000.00,380000.00,0,'Co giãn tốt','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSm1TrtaluO2tslZ16Ui5Pep88I6BBqPSxwoozC1arOmyegqco5pr_ahSD0&s=10',1),(26,2,'Quần Jean Slimfit - Đen - Size 30',200000.00,380000.00,0,'Co giãn tốt','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSm1TrtaluO2tslZ16Ui5Pep88I6BBqPSxwoozC1arOmyegqco5pr_ahSD0&s=10',1),(27,2,'Quần Tây Âu - Đen - Size 30',220000.00,420000.00,0,'Dáng ôm vừa','https://4menshop.com/cache/image/300x400/images/thumbs/2025/04/quan-tay-phoi-day-soc-o-tui-sau-form-slimfit-qt066_small-19209.jpg',1),(28,2,'Quần Short Khaki - Kem - Size 30',140000.00,250000.00,0,'Thoáng mát','https://images.unsplash.com/photo-1591195853828-11db59a44f6b?w=300&q=80',1),(29,2,'Quần Jean Slimfit - Xanh - Size 31',200000.00,380000.00,0,'Co giãn tốt','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSm1TrtaluO2tslZ16Ui5Pep88I6BBqPSxwoozC1arOmyegqco5pr_ahSD0&s=10',1),(30,2,'Quần Jean Slimfit - Đen - Size 31',200000.00,380000.00,0,'Co giãn tốt','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSm1TrtaluO2tslZ16Ui5Pep88I6BBqPSxwoozC1arOmyegqco5pr_ahSD0&s=10',1),(31,2,'Quần Tây Âu - Đen - Size 31',220000.00,420000.00,0,'Dáng ôm vừa','https://4menshop.com/cache/image/300x400/images/thumbs/2025/04/quan-tay-phoi-day-soc-o-tui-sau-form-slimfit-qt066_small-19209.jpg',1),(32,2,'Quần Short Khaki - Kem - Size 31',140000.00,250000.00,0,'Thoáng mát','https://images.unsplash.com/photo-1591195853828-11db59a44f6b?w=300&q=80',1),(33,2,'Quần Jean Slimfit - Xanh - Size 32',200000.00,380000.00,0,'Co giãn tốt','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSm1TrtaluO2tslZ16Ui5Pep88I6BBqPSxwoozC1arOmyegqco5pr_ahSD0&s=10',1),(34,2,'Quần Jean Slimfit - Đen - Size 32',200000.00,380000.00,0,'Co giãn tốt','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSm1TrtaluO2tslZ16Ui5Pep88I6BBqPSxwoozC1arOmyegqco5pr_ahSD0&s=10',1),(35,2,'Quần Tây Âu - Đen - Size 32',220000.00,420000.00,0,'Dáng ôm vừa','https://4menshop.com/cache/image/300x400/images/thumbs/2025/04/quan-tay-phoi-day-soc-o-tui-sau-form-slimfit-qt066_small-19209.jpg',1),(36,2,'Quần Short Khaki - Kem - Size 32',140000.00,250000.00,0,'Thoáng mát','https://images.unsplash.com/photo-1591195853828-11db59a44f6b?w=300&q=80',1),(37,3,'Áo Croptop Năng Động - Trắng - Size XS',90000.00,150000.00,0,'Kiểu dáng Hàn Quốc','https://images.unsplash.com/photo-1503342217505-b0a15ec3261c?w=300&q=80',1),(38,3,'Áo Croptop Năng Động - Hồng - Size XS',90000.00,150000.00,0,'Kiểu dáng Hàn Quốc','https://images.unsplash.com/photo-1503342217505-b0a15ec3261c?w=300&q=80',1),(39,3,'Áo Len Tăm Nữ - Be - Size XS',130000.00,220000.00,0,'Chất len mềm mịn','https://images.unsplash.com/photo-1620799140408-edc6dcb6d633?w=300&q=80',1),(40,3,'Áo Croptop Năng Động - Trắng - Size S',90000.00,150000.00,0,'Kiểu dáng Hàn Quốc','https://images.unsplash.com/photo-1503342217505-b0a15ec3261c?w=300&q=80',1),(41,3,'Áo Croptop Năng Động - Hồng - Size S',90000.00,150000.00,0,'Kiểu dáng Hàn Quốc','https://images.unsplash.com/photo-1503342217505-b0a15ec3261c?w=300&q=80',1),(42,3,'Áo Len Tăm Nữ - Be - Size S',130000.00,220000.00,0,'Chất len mềm mịn','https://images.unsplash.com/photo-1620799140408-edc6dcb6d633?w=300&q=80',1),(43,3,'Áo Croptop Năng Động - Trắng - Size M',90000.00,150000.00,0,'Kiểu dáng Hàn Quốc','https://images.unsplash.com/photo-1503342217505-b0a15ec3261c?w=300&q=80',1),(44,3,'Áo Croptop Năng Động - Hồng - Size M',90000.00,150000.00,0,'Kiểu dáng Hàn Quốc','https://images.unsplash.com/photo-1503342217505-b0a15ec3261c?w=300&q=80',1),(45,3,'Áo Len Tăm Nữ - Be - Size M',130000.00,220000.00,0,'Chất len mềm mịn','https://images.unsplash.com/photo-1620799140408-edc6dcb6d633?w=300&q=80',1),(46,4,'Quần Ống Rộng Nữ - Đen - Size S',180000.00,320000.00,0,'Hack dáng cực đỉnh','https://images.unsplash.com/photo-1604176354204-9268737828e4?w=300&q=80',1),(47,4,'Chân Váy Xếp Ly - Caro - Size S',150000.00,280000.00,0,'Dễ thương','https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcTfwDBUIHUrMakw1KzvURo8pN0hRVkYhleLEROqQh-TtI--DqVgrCdX0XlpiqBFOZ_K9rGdtqhaazciSmUZ8BRVCxfLCoejJsxsd2Y7RTmMSUmqzJDHENVs&usqp=CAc',1),(48,4,'Quần Ống Rộng Nữ - Đen - Size M',180000.00,320000.00,0,'Hack dáng cực đỉnh','https://images.unsplash.com/photo-1604176354204-9268737828e4?w=300&q=80',1),(49,4,'Chân Váy Xếp Ly - Caro - Size M',150000.00,280000.00,0,'Dễ thương','https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcTfwDBUIHUrMakw1KzvURo8pN0hRVkYhleLEROqQh-TtI--DqVgrCdX0XlpiqBFOZ_K9rGdtqhaazciSmUZ8BRVCxfLCoejJsxsd2Y7RTmMSUmqzJDHENVs&usqp=CAc',1),(50,4,'Quần Ống Rộng Nữ - Đen - Size L',180000.00,320000.00,0,'Hack dáng cực đỉnh','https://images.unsplash.com/photo-1604176354204-9268737828e4?w=300&q=80',1),(51,4,'Chân Váy Xếp Ly - Caro - Size L',150000.00,280000.00,0,'Dễ thương','https://encrypted-tbn1.gstatic.com/shopping?q=tbn:ANd9GcTfwDBUIHUrMakw1KzvURo8pN0hRVkYhleLEROqQh-TtI--DqVgrCdX0XlpiqBFOZ_K9rGdtqhaazciSmUZ8BRVCxfLCoejJsxsd2Y7RTmMSUmqzJDHENVs&usqp=CAc',1),(52,5,'Sneaker X-Max - Đỏ - Size 39',350000.00,650000.00,0,'Đế mút siêu nhẹ','https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=300&q=80',1),(53,5,'Sneaker X-Max - Trắng - Size 39',350000.00,650000.00,0,'Đế mút siêu nhẹ','https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=300&q=80',1),(54,5,'Giày Lười Da Bò - Nâu - Size 39',450000.00,850000.00,0,'Da bò dập vân','https://fttleather.com/uploads/1026/product/2025/05/19/tasd-2916.webp',1),(55,5,'Sneaker X-Max - Đỏ - Size 40',350000.00,650000.00,0,'Đế mút siêu nhẹ','https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=300&q=80',1),(56,5,'Sneaker X-Max - Trắng - Size 40',350000.00,650000.00,0,'Đế mút siêu nhẹ','https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=300&q=80',1),(57,5,'Giày Lười Da Bò - Nâu - Size 40',450000.00,850000.00,0,'Da bò dập vân','https://fttleather.com/uploads/1026/product/2025/05/19/tasd-2916.webp',1),(58,5,'Sneaker X-Max - Đỏ - Size 41',350000.00,650000.00,0,'Đế mút siêu nhẹ','https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=300&q=80',1),(59,5,'Sneaker X-Max - Trắng - Size 41',350000.00,650000.00,0,'Đế mút siêu nhẹ','https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=300&q=80',1),(60,5,'Giày Lười Da Bò - Nâu - Size 41',450000.00,850000.00,0,'Da bò dập vân','https://fttleather.com/uploads/1026/product/2025/05/19/tasd-2916.webp',1),(61,5,'Sneaker X-Max - Đỏ - Size 42',350000.00,650000.00,0,'Đế mút siêu nhẹ','https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=300&q=80',1),(62,5,'Sneaker X-Max - Trắng - Size 42',350000.00,650000.00,0,'Đế mút siêu nhẹ','https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=300&q=80',1),(63,5,'Giày Lười Da Bò - Nâu - Size 42',450000.00,850000.00,0,'Da bò dập vân','https://fttleather.com/uploads/1026/product/2025/05/19/tasd-2916.webp',1),(64,5,'Giày Cao Gót Mũi Nhọn - Đen - Size 36',280000.00,450000.00,10,'Gót cao 7cm','https://images.unsplash.com/photo-1543163521-1bf539c55dd2?w=300&q=80',1),(65,5,'Giày Cao Gót Mũi Nhọn - Đen - Size 37',280000.00,450000.00,10,'Gót cao 7cm','https://images.unsplash.com/photo-1543163521-1bf539c55dd2?w=300&q=80',1),(66,5,'Giày Cao Gót Mũi Nhọn - Đen - Size 38',280000.00,450000.00,10,'Gót cao 7cm','https://images.unsplash.com/photo-1543163521-1bf539c55dd2?w=300&q=80',1),(67,6,'Đồng hồ Classic - Bạc',800000.00,1500000.00,10,'Dây thép không gỉ','https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=300&q=80',1),(68,6,'Đồng hồ Classic - Vàng',850000.00,1600000.00,5,'Dây thép mạ vàng','https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=300&q=80',1),(69,6,'Túi Đeo Chéo Da - Đen',120000.00,250000.00,10,'Da PU chống nước','https://images.unsplash.com/photo-1548036328-c9fa89d128fa?w=300&q=80',1),(70,6,'Thắt Lưng Da Thật - Đen',180000.00,350000.00,10,'Khóa kim loại tự động','https://images.unsplash.com/photo-1624222247344-550fb60583dc?w=300&q=80',1),(71,6,'Kính Râm Thời Trang - Đen',150000.00,290000.00,10,'Chống tia UV Z','https://images.unsplash.com/photo-1511499767150-a48a237f0083?w=300&q=80',1),(72,6,'Kính Râm Thời Trang - Trắng',150000.00,290000.00,10,'Chống tia UV Z','https://images.unsplash.com/photo-1511499767150-a48a237f0083?w=300&q=80',1),(73,6,'Kính Râm Thời Trang - Vàng',150000.00,290000.00,10,'Chống tia UV Z','https://images.unsplash.com/photo-1511499767150-a48a237f0083?w=300&q=80',1);
/*!40000 ALTER TABLE `san_pham` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thanh_toan`
--

DROP TABLE IF EXISTS `thanh_toan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thanh_toan` (
  `maTT` int NOT NULL AUTO_INCREMENT,
  `maDH` int NOT NULL,
  `ngayTT` datetime DEFAULT CURRENT_TIMESTAMP,
  `tienKhachDua` decimal(15,2) NOT NULL,
  `tienThua` decimal(15,2) NOT NULL,
  `ghiChu` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`maTT`),
  UNIQUE KEY `maDH` (`maDH`),
  CONSTRAINT `thanh_toan_ibfk_1` FOREIGN KEY (`maDH`) REFERENCES `don_hang` (`maDH`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thanh_toan`
--

LOCK TABLES `thanh_toan` WRITE;
/*!40000 ALTER TABLE `thanh_toan` DISABLE KEYS */;
/*!40000 ALTER TABLE `thanh_toan` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-14 14:43:40
