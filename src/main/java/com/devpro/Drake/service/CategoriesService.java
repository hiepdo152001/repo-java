package com.devpro.Drake.service;

import java.io.IOException;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.devpro.Drake.entities.Categories;

@Service
public class CategoriesService extends BaseService<Categories> {
 
	@Autowired
	private CategoriesService categoriesService;
	@Override
	protected Class<Categories> clazz() {
		return Categories.class;
	}
	@Transactional
	public Categories update(Categories c)
	throws IOException{
		Categories categoryInDB =getById(c.getId());
		
		return super.saveOrUpdate(c);
	}

}

