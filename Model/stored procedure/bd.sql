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

CREATE PROCEDURE `sp_edit_sizes` () 
BEGIN
SELECT tbl_product.p_id,
        tbl_product.p_name,
        tbl_product.p_old_price,
		tbl_product.p_current_price,
		tbl_product.p_qty,
		tbl_product.p_featured_photo,
		tbl_product.p_is_featured,
		tbl_product.p_is_active,
		tbl_product.ecat_id,

		tbl_end_category.ecat_id,
		tbl_end_category.ecat_name,

		tbl_mid_category.mcat_id,
		tbl_mid_category.mcat_name,

		tbl_top_category.tcat_id,
		tbl_top_category.tcat_name

		FROM tbl_product
		JOIN tbl_end_category
		ON tbl_product.ecat_id = tbl_end_category.ecat_id
		JOIN tbl_mid_category
		ON tbl_end_category.mcat_id = tbl_mid_category.mcat_id
		JOIN tbl_top_category
		ON tbl_mid_category.tcat_id = tbl_top_category.tcat_id
		ORDER BY tbl_product.p_id DESC;
END$$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE `sp_insert_product` (in _p_name varchar(255),
						    in _p_old_price varchar(10),
						    in _p_current_price varchar(10),
						    in _p_qty int(10),
						    in _p_featured_photo varchar(255),
						    in _p_description text,
						    in _p_short_description text,
						    in _p_feature text,
						    in _p_condition text,
						    in _p_return_policy text,
						    in _p_total_view int(11),
						    in _p_is_featured int(1),
						    in _p_is_active int(1),
						    in _ecat_id int(11)) 
BEGIN
INSERT INTO tbl_product(
						    p_name,
						    p_old_price,
						    p_current_price,
						    p_qty,
						    p_featured_photo,
						    p_description,
						    p_short_description,
						    p_feature,
						    p_condition,
						    p_return_policy,
						    p_total_view,
						    p_is_featured,
						    p_is_active,
						    ecat_id) 
VALUES (_p_name,
            _p_old_price,
            _p_current_price,
            _p_qty,
            _p_featured_photo,
            _p_description,
            _p_short_description,
            _p_feature,
            _p_condition,
            _p_return_policy,
            _p_total_view,
            _p_is_featured,
            _p_is_active,
            _ecat_id);
END$$

DELIMITER


-- procedure delete products

DELIMITER $$
CREATE PROCEDURE `sp_delete_product` (in idProductD int(11))
BEGIN 
DELETE FROM tbl_product WHERE p_id=idProductD; 
END$$

DELIMITER

--edit products

DELIMITER $$
CREATE PROCEDURE `sp_edit_product` (in p_idE int(11),
									in p_nameE varchar(255),
									in p_old_priceE varchar(10),
									in p_current_priceE varchar(10),
									in p_qtyE int(10),
									in p_descriptionE text,
									in p_short_descriptionE text,
									in p_featureE text,
									in p_conditionE text,
									in p_return_policyE text,
									in p_is_featuredE int(1),
									in p_is_activeE int(1),
									in ecat_idE int(11))
BEGIN
	UPDATE tbl_product SET 	p_name = p_nameE,
						    p_old_price = p_old_priceE,
						    p_current_price = p_current_priceE,
						    p_qty = p_qtyE,
						    p_description = p_descriptionE,
						    p_short_description = p_short_descriptionE,
						    p_feature = p_featureE,
						    p_condition = p_conditionE,
						    p_return_policy = p_return_policyE,
						    p_is_featured = p_is_featuredE,
						    p_is_active = p_is_activeE,
						    ecat_id = ecat_idE
	WHERE p_id=p_idE;
END$$
DELIMITER;
-- search product
DELIMITER $$
CREATE PROCEDURE `sp_search_product`  (in _p_is_active int(1), in _search varchar(255))
BEGIN
SELECT * FROM tbl_product WHERE p_is_active = _p_is_active AND p_name LIKE _search;
END$$

DELIMITER 