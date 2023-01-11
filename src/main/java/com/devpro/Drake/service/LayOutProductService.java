package com.devpro.Drake.service;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import com.devpro.Drake.dto.ProductSearchModel;
import com.devpro.Drake.entities.Product;
import com.devpro.Drake.entities.product_image;
import com.github.slugify.Slugify;



@Service
public class LayOutProductService  extends BaseService<Product> {

	@Autowired
	private ProductImagesService productImagesService;
	
	@Override
	protected Class<Product> clazz() {
		// TODO Auto-generated method stub
		return Product.class;
	}
	
	
	private int getCurrentPage(HttpServletRequest request) {
		try {
			return Integer.parseInt(request.getParameter("page"));
		} catch (Exception e) {
			return 1;
		}
	}
	
	
	private boolean isEmptyUploadFile(MultipartFile[] images) {
		if (images == null || images.length <= 0)
			return true;

		if (images.length == 1 && images[0].getOriginalFilename().isEmpty())
			return true;

		return false;
	}
	
	private boolean isEmptyUploadFile(MultipartFile image) {
		return image == null || image.getOriginalFilename().isEmpty();
	}
	
	public PagerData<Product> search(ProductSearchModel searchModel) {

		// khởi tạo câu lệnh
		String sql = "SELECT * FROM tbl_products p WHERE 1=1";
		if (searchModel != null) {
			// tìm kiếm theo category
			if(searchModel.categoryId != null && searchModel.categoryId > 0) {
				sql += " and category_id = " + searchModel.categoryId;
			}
			
			//tìm theo seo
			if (!StringUtils.isEmpty(searchModel.seo)) {
				sql += " and p.seo = '" + searchModel.seo + "'";
			}

			// tìm kiếm sản phẩm hot
//			if (searchModel.isHot != null) {
//				sql += " and p.is_hot = '" + searchModel.seo + "'";
//			}
			
			// tim kiem san pham theo seachText
			if (!StringUtils.isEmpty(searchModel.keyword)) {
				sql += " and (p.title like '%" + searchModel.keyword + "%'" + 
						     " or p.description like '%" + searchModel.keyword + "%')";
				    
			}
		}

//		 chi lay san pham chua xoa
				sql += " and p.status=1 ";
				
		return executeByNativeSQL(sql, searchModel == null ? 0 : searchModel.getPage());
		
	}
}

