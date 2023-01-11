package com.devpro.Drake.service;

import java.io.File;
import java.io.IOException;


import javax.transaction.Transactional;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.devpro.Drake.entities.User;

@Service
public class UserService extends BaseService<User> {
	
	@Override
	protected Class<User> clazz() {
		return User.class;
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
	
	public User loadUserByUsername(String userName) {
		String sql = "select * from tbl_users u where u.username = '" + userName + "'and status = 1";
		return this.getOneByNativeSQL(sql);
	}
	public User loadUserByEmail(String email)
	{
		String sql="select * from tbl_users u where u.Email = '" + email + "'and status = 1";
		return this.getOneByNativeSQL(sql);
	}
	
	@Transactional
	public User add(User u, MultipartFile usertAvatar)throws IllegalStateException, IOException{
		if(!isEmptyUploadFile(usertAvatar))
		{
			//tạo đường dẫn tới folder chứ avatar
			String parthToFile="D:/BE/upload/product/avatar/"+ usertAvatar.getOriginalFilename();
			//lưu avatar vào đường dẫn trên
			usertAvatar.transferTo(new File(parthToFile));
			u.setAvatar("product/avatar/"+usertAvatar.getOriginalFilename());
		}
		return super.saveOrUpdate(u);
	}

	@Transactional
	public User update(User u, MultipartFile userAvatar)throws IllegalStateException,IOException{
		
		User userInDb=super.getById(u.getId());
		//có đẩy avatar lên
		if(!isEmptyUploadFile(userAvatar))
		{
			new File("D:/BE/upload/"+userInDb.getAvatar()).delete();
			userAvatar.transferTo(new File("D:/BE/upload/User/avatar/" + userAvatar.getOriginalFilename()));
			u.setAvatar("User/avatar/"+userAvatar.getOriginalFilename());
		}
		//nếu không thay đổi avatar
		else {
			u.setAvatar(userInDb.getAvatar());
		}
		u.setUsername(userInDb.getUsername());
		u.setPassword(userInDb.getPassword());
		return saveOrUpdate(u);
	}
	
}
