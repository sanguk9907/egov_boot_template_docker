package bootTemTest.exception.handler;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;

public class ThrowExceptions {

	public void jsonException(String code, String message, String status, HttpServletResponse res) throws Exception {

		ObjectMapper objectMapper = new ObjectMapper();

		Map<String, Object> entity = new HashMap<String, Object>();
		entity.put("code", code);
		entity.put("message", message);
		entity.put("status", status);
		String result = objectMapper.writeValueAsString(entity);

		res.setCharacterEncoding("UTF-8");
		res.setContentType("application/json");
		res.getWriter().print(result);
	}
	
	public ModelAndView jspException(String code, String message) {
		ModelAndView model = new ModelAndView("common/error");
		model.addObject("code", code);
		model.addObject("message", message);
		return model;
	}

}
