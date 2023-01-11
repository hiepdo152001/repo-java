package com.devpro.Drake.service;

import java.io.File;
import java.io.IOException;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.devpro.Drake.entities.Product;
import com.devpro.Drake.entities.SaleOrderProducts;
import com.devpro.Drake.entities.product_image;
import com.github.slugify.Slugify;

@Service
public class SaleOderProductService extends BaseService<SaleOrderProducts>{

	@Override
	protected Class<SaleOrderProducts> clazz() {
		// TODO Auto-generated method stub
		return SaleOrderProducts.class;
	}

	@Transactional // đảm bảo việc insert dữ liệu luôn song song cả 3 cái. 1 cái lỗi => lỗi all . 
	public SaleOrderProducts add(SaleOrderProducts p)
			throws IllegalStateException, IOException {

		// lÆ°u vÃ o database
		return super.saveOrUpdate(p);
		
	}
	
	
	//Sửa Sản Phẩm
	@Transactional
	public SaleOrderProducts update(SaleOrderProducts p)
			throws IllegalStateException, IOException {

		// lưu vào database
		return super.saveOrUpdate(p);
	}
	

}
