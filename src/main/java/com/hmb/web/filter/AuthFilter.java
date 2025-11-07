package com.hmb.web.filter;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

public class AuthFilter implements Filter {
  @Override public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain) throws IOException, ServletException {
    HttpServletRequest r=(HttpServletRequest)req;
    HttpServletResponse w=(HttpServletResponse)res;
    if(r.getSession().getAttribute("user")==null){
      w.sendRedirect(r.getContextPath()+"/login");
      return;
    }
    chain.doFilter(req,res);
  }
}
