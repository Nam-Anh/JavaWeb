package filter;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MyFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        try {
            String contextPath = httpRequest.getRequestURI();
            if (contextPath.endsWith(".jsp")) {
                String[] str = contextPath.split("/");
                String[] path = str[str.length - 1].split("\\.");

                httpResponse.sendRedirect(path[0]);
            } else {
                chain.doFilter(request, response);
            }
        } catch (Exception ex) {
            //Log error
            Logger.getLogger(MyFilter.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @Override
    public void destroy() {

    }

}
