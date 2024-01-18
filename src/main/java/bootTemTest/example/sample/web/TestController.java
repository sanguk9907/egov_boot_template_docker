package bootTemTest.example.sample.web;

import javax.ws.rs.GET;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TestController {

	@GetMapping("/")
	public String Home(ModelMap model) {
		model.addAttribute("title", "Oraclizer");
		model.addAttribute("css", "/css/home/index.css");
		return "main/main2";
	}
}
