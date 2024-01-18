package bootTemTest.util.helper;

import org.springframework.web.servlet.HandlerInterceptor;

public class CustomInterceptor implements HandlerInterceptor {

//	@Autowired
//	private MemberMapper mapper;
//
//	@Override
//	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
//			throws Exception {
//		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
//		if (authentication != null && !authentication.getPrincipal().equals("anonymousUser")) {
//			CustomUserDetails member = (CustomUserDetails) authentication.getPrincipal();
//			HttpSession session = request.getSession(false);
//			String jSessionId = session.getId();
//
//			HashMap<String, Object> DupliLoginCheck = mapper.DupliLoginCheck(jSessionId, member.getMB_NO());
//			if (!DupliLoginCheck.get("loginsession").equals(jSessionId)) {
//				mapper.deleteDupliLoginSessionOne(jSessionId,member.getMB_NO());
//				response.sendRedirect("/logout?reson=DUPLICATE_LOGIN");
//			}
//		}
//		return true;
//	}
}
