package bootTemTest.example.sample.web;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import bootTemTest.util.helper.Helper;

@Controller
public class TestController {
	
	@Autowired
	Helper helper;

	@GetMapping("/")
	public String Home(HttpServletRequest req, ModelMap model) throws Exception {
		model.addAttribute("title", "Oraclizer");
		model.addAttribute("css", "/css/home/index.css");
		System.out.println("????");
		return "main/main2";
	}
	
	@PostMapping("/upload/img")
	@ResponseBody
	public Map<String,String> uploadTest(@RequestParam("thumb") MultipartFile thumb, HttpServletRequest req) throws Exception {
		
		System.out.println(req.getSession().getServletContext().getRealPath("images/logo"));
		
		String src = helper.ImageUpload(req, thumb, "test");
		
		Map<String,String> result = new HashMap<String, String>();
		result.put("message","good");
		result.put("status","good");
		result.put("src",src);
		return result;
	}
}
