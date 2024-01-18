package bootTemTest.example.member.web;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@Controller
public class MemberController {

//	@Autowired
//	BCryptPasswordEncoder bPasswordEncoder;
//
//	@Resource(name = "MemberService")
//	MemberService memberService;
//	
//	@Autowired
//	private DefaultBeanValidator beanValidator;
//
//	@Autowired
//	private JavaMailSender mailSender;
//	
//	@Autowired
//	Helper helper;

	@GetMapping("/member/login")
	public String Login(HttpSession session, HttpServletRequest req, @RequestParam(value = "exception", required = false) String exception,
			ModelMap model, RedirectAttributes redirectAttributes) throws Exception {
		model.addAttribute("title", "한국수목원");
		model.addAttribute("css", "/css/member/login.css");
//		
//		session.removeAttribute("signupVO");
//		String userIP = req.getRemoteAddr();
//		HashMap<String, Object> VisitCheck = memberService.getVisit(userIP);
//		String userAgent = req.getHeader("User-Agent").toUpperCase();
//		String device;
//		if (userAgent.indexOf("MOBI") > -1) {
//			device = "Mobile";
//		} else {
//			device = "Desktop";
//		}
//		HashMap<String, Object> params = new HashMap<String, Object>();
//		params.put("userIP", userIP);
//		params.put("userType", "none");
//		params.put("device", device);
//		if (VisitCheck == null) {
//			memberService.insertVisit(params);
//		} else {
//			String visitDate = VisitCheck.get("regdate").toString();
//			String nowDate = LocalDate.now().toString();
//
//			if (!visitDate.equals(nowDate)) {
//				memberService.insertVisit(params);
//			}
//		}
//		if (exception != null) {
//			redirectAttributes.addFlashAttribute("exception", exception);
//			return "redirect:/member/login";
//		}else if(req.getParameter("DUPLICATE_LOGIN") != null) {
//			redirectAttributes.addFlashAttribute("DUPLICATE_LOGIN", true);
//			return "redirect:/member/login";
//		}
		throw new MessagingException();
//		return "member/login";
	}

}