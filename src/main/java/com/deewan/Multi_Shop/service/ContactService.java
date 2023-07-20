package com.deewan.Multi_Shop.service;

import com.deewan.Multi_Shop.connection.DataBase;
import com.deewan.Multi_Shop.dao.ContactDao;
import com.deewan.Multi_Shop.dto.ContactDto;

public class ContactService {
	ContactDao contactDao=new ContactDao(DataBase.getConnection());

	public boolean saveContactDaoService(ContactDto contactDto) {
		return contactDao.saveContactDao(contactDto);
	}
}
