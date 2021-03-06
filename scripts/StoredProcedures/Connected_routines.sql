
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `createChat`(pIdPerson1 int(11), pIdPerson2 int(11))
BEGIN
	insert into Chat(idChat, idPerson1, idPerson2)
    values(null, pIdPerson1, pIdPerson2);
    commit;
END ;;
DELIMITER ;


DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertCountry`(pDescription varchar(45))
BEGIN
	insert into Country(idCountry, description)
    values (null, pDescription);
    commit;
END ;;
DELIMITER ;



DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `registerPerson`(pFirstName varchar(45), pLastName varchar(45), pEmail varchar(45), 
									pPassword varchar(45), pBirthdate date, pProfession varchar(45),
									pDescription varchar(45), pGender varchar(1), pIdAvatar int(11), 
									pIdCounry int(11) )
BEGIN
	insert into Person(idPerson, firstName, lastName, email, password, birthdate,
						profession, description , gender, idAvatar, idCountry) 
	
	values(null, pFirstName, pLastName, pEmail, pPassword, pBirthdate, pProfession,
		pDescription, pGender, pIdAvatar, pIdCounry);
	
    commit;
END ;;
DELIMITER ;

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `createPost`(pIdPerson int(11), 
														pIdMedia int(11), 
														pText varchar(100), 
														pDate date)
BEGIN
	if pIdMedia = -1 THEN SET pIdMedia = null; END IF;
	insert into Post(idPost, idPerson, idMedia, text, date)
	values(null, pIdPerson, pIdMedia, pText, pDate);
END

DELIMITER $$

CREATE DEFINER=`root`@`localhost` PROCEDURE `createLike`(pIdPost int(11), pIdPerson int(11))
BEGIN
	insert into Likes.Like(pIdLike, pIdPost, pIdPerson)
	values(null, pIdPost, pIdPerson);
	commit;
END