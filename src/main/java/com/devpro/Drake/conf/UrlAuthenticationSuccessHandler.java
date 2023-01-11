package com.devpro.Drake.conf;



import java.io.IOException;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import aj.org.objectweb.asm.Handle;

public class UrlAuthenticationSuccessHandler implements AuthenticationSuccessHandler  {

	private RedirectStrategy redirectStrategy=new DefaultRedirectStrategy();
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		handle(request, response , authentication);
		clearAuthenticationAttributes(request);
		// TODO Auto-generated method stub
		
	}
protected void handle(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException {
		// TODO Auto-generated method stub
		String targetUrl= determineTargetUrl(authentication);
		if(response.isCommitted())
		{
			return ;
		}
		redirectStrategy.sendRedirect(request, response, targetUrl);	
		
}
     
	protected void clearAuthenticationAttributes(HttpServletRequest request) {
		// TODO Auto-generated method stub
		
		HttpSession session=request.getSession(false);
		if(session==null)
		{
			return;
		}
		session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);
	}

	

	protected String determineTargetUrl(final Authentication authentication) {
		// TODO Auto-generated method stub
		Map<String, String> roleTargetUrlMap =new HashMap<>();
		roleTargetUrlMap.put("ADMIN", "/admin/user");
		roleTargetUrlMap.put("GUEST","/trangchu");
		final Collection<? extends GrantedAuthority> authority= authentication.getAuthorities();
		for (final GrantedAuthority grantedAuthority : authority) {
			String authorityName =grantedAuthority.getAuthority();
			if(roleTargetUrlMap.containsKey(authorityName))
			{
				return roleTargetUrlMap.get(authorityName);
			}
			
		}
		throw new IllegalStateException();
	}

}
