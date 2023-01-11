package com.devpro.Drake.service;

import org.springframework.stereotype.Service;

import com.devpro.Drake.entities.Role;


@Service
public class RolesService extends BaseService<Role> {
	
	@Override
	protected Class<Role> clazz() {
		return Role.class;
	}

	public Role getGuestRole() {
		return getOneByNativeSQL("SELECT * FROM tbl_roles where name = 'GUEST'");
	}
	public Role getAdminRole() {
		return getOneByNativeSQL("SELECT * FROM tbl_roles where name='ADMIN'");
	}
	
}
