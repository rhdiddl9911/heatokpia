package com.heatokpia.utils;

import javax.servlet.http.HttpServletRequest;

import org.springframework.core.MethodParameter;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;

/*
 * https://stove99.github.io/java/2019/05/15/get-ip-with-annotation/
 */
@Component
public class ClientIPResolver implements HandlerMethodArgumentResolver {

	private static final String[] IP_HEADER_CANDIDATES = {
            "X-Forwarded-For", "Proxy-Client-IP", "WL-Proxy-Client-IP",
            "HTTP_X_FORWARDED_FOR", "HTTP_X_FORWARDED", "HTTP_X_CLUSTER_CLIENT_IP",
            "HTTP_CLIENT_IP", "HTTP_FORWARDED_FOR", "HTTP_FORWARDED", "HTTP_VIA",
            "REMOTE_ADDR"
        };

    @Override
    public boolean supportsParameter(MethodParameter parameter) {
        return parameter.hasParameterAnnotation(ClientIP.class);
    }

    @Override
    public Object resolveArgument(MethodParameter param, ModelAndViewContainer mavc, NativeWebRequest req,
            WebDataBinderFactory wbf) throws Exception {

        HttpServletRequest request = (HttpServletRequest) req.getNativeRequest();

        for (String header : IP_HEADER_CANDIDATES) {
            String ip = request.getHeader(header);

            if (ip != null && ip.length() != 0 && !"unknown".equalsIgnoreCase(ip)) {
                return ip;
            }
        }

        return request.getRemoteAddr();
    }
}
