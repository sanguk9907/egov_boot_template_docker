package bootTemTest.util.helper.web;

import java.nio.file.Files;
import java.nio.file.Path;
import java.util.HashMap;
import java.util.Locale;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HelperController {
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	MessageSource msg;


	@PostMapping("/send/email_code")
	@ResponseBody
	public HashMap<String, Object> send_email_code(@RequestBody HashMap<String, Object> param, HttpServletRequest req, HttpServletResponse response) throws Exception {
		
	    Locale locale = param.get("lang").equals("en") ? new Locale("en") : new Locale("ko");

		if (param.get("name") == null || param.get("name").toString().trim().isEmpty()) {
			throw new IllegalArgumentException(msg.getMessage("landing.send.fail.name.msg", null, locale));
		}
		if (param.get("email") == null || param.get("email").toString().trim().isEmpty()) {
			throw new IllegalArgumentException(msg.getMessage("landing.send.fail.email.msg", null, locale));
		}
		if (param.get("message") == null || param.get("message").toString().trim().isEmpty()) {
			throw new IllegalArgumentException(msg.getMessage("landing.send.fail.content.msg", null, locale));
		}

		String to = "jonghun@oraclizer.io";
		if (req.getServerName().equals("localhost")) {
			to = "tkddnr6079@naver.com";
		}
		String subject = "오라클라이저 문의메일 입니다.";

//		String content = readJspAsString(param);
		String content = param.get("message").toString();
		HashMap<String, Object> jsonObject = new HashMap<String, Object>();
		req.setCharacterEncoding("UTF-8");

		MimeMessage mail = mailSender.createMimeMessage();
		MimeMessageHelper mailHelper;
		mailHelper = new MimeMessageHelper(mail, true, "UTF-8");

		mailHelper.setTo(to);
		mailHelper.setSubject(subject);
		mailHelper.setText(content, true);
		mailSender.send(mail);
		
		jsonObject.put("status", "complete");
		jsonObject.put("message", "아 굿~");
		return jsonObject;
	}

	private String readJspAsString(String type, String checkNum) throws Exception {
		String filePath = "/usr/local/tomcat/webapps/ROOT/jsp/common/email-template.html";

		Path path = Path.of(filePath);
		String templateContent = Files.readString(path);
		
		templateContent = templateContent.replace("[EMAIL_CODE]", String.valueOf(checkNum));

		return templateContent;
	}
//
//	@PostMapping("/email_check_process")
//	public void email_check_process(HttpServletRequest req, HttpServletResponse response) throws Exception {
//		JSONObject jsonObject = new JSONObject();
//		req.setCharacterEncoding("UTF-8");
//		memberService.email_check(req.getParameter("email_code"), req.getParameter("mb_email"), "check");
//		jsonObject.put("status", "complete");
//		jsonObject.put("message", "인증이 완료되었습니다.");
//		response.setCharacterEncoding("UTF-8");
//		response.setContentType("application/json");
//		response.getWriter().print(jsonObject);
//	}
//
//	@PostMapping("/check/private")
//	public void check_private(HttpServletRequest req, HttpServletResponse response, Authentication authentication)
//			throws Exception {
//		JSONObject jsonObject = new JSONObject();
//		req.setCharacterEncoding("UTF-8");
//		CustomUserDetails member = (CustomUserDetails) authentication.getPrincipal();
//		String mb_private = member.getMB_PRIVATE();
//		String req_private = req.getParameter("private_key");
//		if (!mb_private.equals(req_private)) {
//			throw new NoMatchPrivateKeyException();
//		}
//		jsonObject.put("status", "complete");
//		jsonObject.put("message", "본인 확인이 완료되었습니다.");
//		response.setCharacterEncoding("UTF-8");
//		response.setContentType("application/json");
//		response.getWriter().print(jsonObject);
//	}
//
//	@PostMapping("/aprv/private")
//	public void aprv_private(HttpServletRequest req, HttpServletResponse response, Authentication authentication)
//			throws Exception {
//		JSONObject jsonObject = new JSONObject();
//		req.setCharacterEncoding("UTF-8");
//		CustomUserDetails member = (CustomUserDetails) authentication.getPrincipal();
//		String mb_private = member.getMB_PRIVATE();
//		String req_private = req.getParameter("private_key");
//		if (!mb_private.equals(req_private)) {
//			throw new NoMatchPrivateKeyException();
//		}
//
//		NFTservice.aprvAdmin(req);
//
//		jsonObject.put("status", "complete");
//		jsonObject.put("message", "승인이 완료되었습니다.");
//		response.setCharacterEncoding("UTF-8");
//		response.setContentType("application/json");
//		response.getWriter().print(jsonObject);
//	}
//
//	@PostMapping("/aprv/member/private")
//	public void aprv_member_private(HttpServletRequest req, HttpServletResponse response, Authentication authentication)
//			throws Exception {
//		JSONObject jsonObject = new JSONObject();
//		req.setCharacterEncoding("UTF-8");
//		CustomUserDetails member = (CustomUserDetails) authentication.getPrincipal();
//		String mb_private = member.getMB_PRIVATE();
//		String req_private = req.getParameter("private_key");
//		System.out.println(mb_private);
//		System.out.println(req_private);
//		if (!mb_private.equals(req_private)) {
//			throw new NoMatchPrivateKeyException();
//		}
//
//		memberService.aprvAdmin(req);
//
//		jsonObject.put("status", "complete");
//		jsonObject.put("message", "승인이 완료되었습니다.");
//		response.setCharacterEncoding("UTF-8");
//		response.setContentType("application/json");
//		response.getWriter().print(jsonObject);
//	}
//
//	@PostMapping("/session/out")
//	public void session_out(HttpServletRequest req, HttpServletResponse response, Authentication authentication)
//			throws Exception {
//
//		SecurityContextHolder.clearContext();
//		JSONObject jsonObject = new JSONObject();
//		NotificationController.sseComplete(authentication);
//
//		jsonObject.put("status", "complete");
//		jsonObject.put("message", "세션이 만료되었습니다. 로그인페이지로 이동합니다.");
//		response.setCharacterEncoding("UTF-8");
//		response.setContentType("application/json");
//		response.getWriter().print(jsonObject);
//	}

}
