package com.devpro.Drake.service;

import org.springframework.stereotype.Service;

import com.devpro.Drake.entities.product_image;

@Service
public class ProductImagesService extends BaseService<product_image>{

	@Override
	protected Class<product_image> clazz() {
		// TODO Auto-generated method stub
		return product_image.class;
	}
  
}
