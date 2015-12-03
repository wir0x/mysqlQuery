DROP PROCEDURE IF EXISTS buhodb.delete_smartphone_with_imei;
CREATE DEFINER=`root`@`%` PROCEDURE `delete_smartphone_with_imei`(IN p_imei VARCHAR(255))
BEGIN
    DELETE from positions WHERE device_id in (select id from device where imei = p_imei);
    DELETE from positions_buffer WHERE device_id in (select id from device where imei = p_imei);
    delete from user_device where device_id in (select id from device where imei = p_imei);
    delete from subscription where device_id in (select id from device where imei = p_imei);
#     delete from payment_request_item where payment_request_id in (select id from payment_request where device_id in (select id from device where imei = p_imei));
#     delete from payment_request where device_id in (select id from device where imei = p_imei);
    delete from device where imei = p_imei;
  END;


SET @deviceId = 112;

DELETE FROM positions WHERE device_id =  @deviceId ;
DELETE FROM positions_buffer WHERE device_id =  @deviceId ;
DELETE FROM user_device WHERE device_id = @deviceId;
DELETE FROM subscription WHERE device_id = @deviceId;
DELETE FROM sms_control WHERE device_id = @deviceId;
DELETE FROM device WHERE id = @deviceId;

CREATE PROCEDURE dowhile()
  BEGIN
    DECLARE v1 INT DEFAULT 41;

    WHILE v1 > 24 DO
      SET @deviceId = v1;

      DELETE FROM positions WHERE device_id =  @deviceId ;
      DELETE FROM positions_buffer WHERE device_id =  @deviceId ;
      DELETE FROM user_device WHERE device_id = @deviceId;
      DELETE FROM subscription WHERE device_id = @deviceId;
      DELETE FROM sms_control WHERE device_id = @deviceId;
      DELETE FROM alarm_battery WHERE device_id = @deviceId;
      DELETE FROM device WHERE id = @deviceId;
    SET v1 = v1 - 1;
  END WHILE;
END;


SET @accountId = 15;

SET @userID = (SELECT id FROM users WHERE account_id = @accountId);
DELETE FROM user_role WHERE user_id = @userID;
DELETE  FROM users WHERE account_id = @accountId;

DELETE  FROM account WHERE id = @accountId;



# DROP PROCEDURE dowhile;
# CALL dowhile();