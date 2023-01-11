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
public class ProductService  extends BaseService<Product>{

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
			                
						     " or p.description like '%" + searchModel.keyword + "%')"
						     
						     ;
			}
		}

//		 chi lay san pham chua xoa
//				sql += " and p.status=1 ";
				
		return executeByNativeSQL(sql, searchModel == null ? 0 : searchModel.getPage());
		
	}

	

	
	@Transactional // đảm bảo việc insert dữ liệu luôn song song cả 3 cái. 1 cái lỗi => lỗi all . 
	public Product add(Product p, MultipartFile productAvatar, MultipartFile[] productPictures)
			throws IllegalStateException, IOException {

		// kiểm tra xem admin có đẩy avatar lên không ???
		//nếu có đẩy lên 
				if (!isEmptyUploadFile(productAvatar)) {
					// tạo đường dẫn tới folder chứa avatar
					String pathToFile = "D:/BE/upload/product/avatar/" + productAvatar.getOriginalFilename();

					// lưu avatar vào đường dẫn trên
					productAvatar.transferTo(new File(pathToFile));

					p.setAvatar("product/avatar/" + productAvatar.getOriginalFilename());
				}


				// có đẩy pictures(product_images) ???
				
				if (!isEmptyUploadFile(productPictures)) {

					// nếu admin đẩy lên thì duyệt tất cả file đẩy lên và lưu trên server
					for (MultipartFile pic : productPictures) {
						// lưu ảnh admin đẩy lên vào server
						pic.transferTo(new File("D:/BE/upload/product/pictures/" + pic.getOriginalFilename()));

						// tạo mới 1 bản ghi product_images
						product_image pi = new product_image();
						pi.setPath("product/pictures/" + pic.getOriginalFilename());
						pi.setTitle(pic.getOriginalFilename());

						p.addProductImages(pi);
					}
				}



		//táº¡o seo
		p.setSeo(new Slugify().slugify(p.getTitle()) + "-" + System.currentTimeMillis());
		
		// lÆ°u vÃ o database
		return super.saveOrUpdate(p);
		
	}
	
	
	//Sửa Sản Phẩm
	@Transactional
	public Product update(Product p, MultipartFile productAvatar, MultipartFile[] productPictures)
			throws IllegalStateException, IOException {

		// lấy thông tin cũ của product theo id
		Product productInDb = super.getById(p.getId());

		// có đẩy avartar ??? => xóa avatar cũ đi và thêm avatar mới
		if (!isEmptyUploadFile(productAvatar)) {
			// xóa avatar trong folder lên
			new File("D:/BE/upload/" + productInDb.getAvatar()).delete();

			// add avartar moi
			productAvatar.transferTo(new File("D:/BE/upload/product/avatar/" + productAvatar.getOriginalFilename()));
			p.setAvatar("product/avatar/" + productAvatar.getOriginalFilename());
		} 
		else {
			// su dung lai avatar cu
			p.setAvatar(productInDb.getAvatar());
		}

		// có đẩy pictures ???
		if (!isEmptyUploadFile(productPictures)) {

			// xóa pictures cũ
			if (productInDb.getProductImages() != null && productInDb.getProductImages().size() > 0) {
				for (product_image opi : productInDb.getProductImages()) {
					// xóa avatar trong folder lên
					new File("D:/BE/upload/" + opi.getPath()).delete();

					// xóa dữ liệu trong database
					productImagesService.delete(opi);
				}
			}

			// thêm pictures mới
			for (MultipartFile pic : productPictures) {
				pic.transferTo(new File("D:/BE/upload/product/pictures/" + pic.getOriginalFilename()));

				product_image pi = new product_image();
				pi.setPath("product/pictures/" + pic.getOriginalFilename());
				pi.setTitle(pic.getOriginalFilename());

				p.addProductImages(pi);
			}
		}

		//tạo seo
		p.setSeo(new Slugify().slugify(p.getTitle() + "-" + System.currentTimeMillis()));
		
		// lưu vào database
		return super.saveOrUpdate(p);
	}



}

	


