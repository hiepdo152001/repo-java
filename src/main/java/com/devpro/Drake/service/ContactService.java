package com.devpro.Drake.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.devpro.Drake.dto.ContactSearchModel;
import com.devpro.Drake.entities.Contact;

@Service
public class ContactService  extends BaseService<Contact>{

	@Autowired
	private ContactService contactService;
	
	@Override
	protected Class<Contact> clazz() {
		// TODO Auto-generated method stub
		return Contact.class;
	}
	
	public PagerData<Contact> search(ContactSearchModel searchModel)
	{
		String sql = "SELECT * FROM tbl_contact p WHERE 1=1";
		if (searchModel != null) {
			
			if(searchModel.Id != null && searchModel.Id > 0) {
				sql += " and id = " + searchModel.Id;
			}
			
			// tìm kiếm sản phẩm hot
//			if (searchModel.isHot != null) {
//				sql += " and p.is_hot = '" + searchModel.seo + "'";
//			}
			
			// tim kiem san pham theo seachText
			if (!StringUtils.isEmpty(searchModel.keyword)) {
				sql += " and (p.name like '%" + searchModel.keyword + "%'" + 
						     " or p.email like '%" + searchModel.keyword + "%'"+
						     " or p.message like '%" + searchModel.keyword + "%')"
						     
						     ;
			}
		}

		// chi lay san pham chua xoa
//				sql += " and p.status=1 ";
		return executeByNativeSQL(sql, searchModel == null ? 0 : searchModel.getPage());
		
	
	}

}
