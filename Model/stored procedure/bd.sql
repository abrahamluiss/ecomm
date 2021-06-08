DROP procedure IF EXISTS `sp_insert_size`;

DELIMITER $$
USE `xicia_ecommerce`$$
CREATE PROCEDURE `sp_insert_size` (in sizeNameI varchar(255))
BEGIN
	insert into tbl_size (size_name)
			values (sizeNameI);
END$$

DELIMITER 



DROP procedure IF EXISTS `sp_show_size`;
DELIMITER $$
USE `xicia_ecommerce`$$
CREATE PROCEDURE `sp_show_size` ()
BEGIN
SELECT * FROM tbl_size ORDER BY size_id ASC
END$$

DELIMITER 

CREATE PROCEDURE `sp_delete_sizes` (in idSizeD int(11)) BEGIN DELETE FROM tbl_size WHERE size_id=idSizeD; END 


DELIMITER $$
CREATE PROCEDURE `sp_edit_sizes` (in sizeIdE int(11), in sizeNameE varchar(255)) 
BEGIN 
UPDATE tbl_size SET size_name=sizeNameE WHERE size_id=sizeIdE; 
END$$
DELIMITER ;