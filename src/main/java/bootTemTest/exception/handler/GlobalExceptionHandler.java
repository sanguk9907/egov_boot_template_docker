package bootTemTest.exception.handler;

import java.io.IOException;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.impl.SizeLimitExceededException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.jdbc.BadSqlGrammarException;
import org.springframework.mail.MailException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.multipart.MaxUploadSizeExceededException;
import org.springframework.web.servlet.ModelAndView;

import bootTemTest.CustomException.AlreadyEmailException;
import bootTemTest.CustomException.DateFilterException;
import bootTemTest.CustomException.EmailCheckException;
import bootTemTest.CustomException.EssentialException;
import bootTemTest.CustomException.FreeTypeException;
import bootTemTest.CustomException.LanguageException;
import bootTemTest.CustomException.NoMatchEmailException;
import bootTemTest.CustomException.NoMatchMemberException;
import bootTemTest.CustomException.NoMatchPrivateKeyException;
import bootTemTest.CustomException.NullDataException;
import bootTemTest.CustomException.PassWordException;
import bootTemTest.CustomException.PhoneCheckException;
import bootTemTest.CustomException.RoleException;

@ControllerAdvice
@Order(Ordered.HIGHEST_PRECEDENCE)
public class GlobalExceptionHandler {

	private static final Logger logger = LoggerFactory.getLogger(GlobalExceptionHandler.class);

	ThrowExceptions throwExceptions = new ThrowExceptions();

	@ExceptionHandler({ MessagingException.class, MailException.class })
	public ModelAndView handleMessagingException(Exception e, HttpServletRequest req, HttpServletResponse res)
			throws Exception {
		String type = req.getHeader("Accept").split(",")[0];
		String code = "[400]";
		String message = "이메일 전송에 실패했습니다. 다시 한 번 시도해주세요.";
		String status = "email_send_error";
		logger.error("========================================");
		logger.error("이메일 전송 실패");
		logger.error("========================================");
		logger.error("", e);
		if (type.equals("text/html")) {
			return throwExceptions.jspException(code, message);
		} else {
			throwExceptions.jsonException(code, message, status, res);
			return null;
		}
	}

	@ExceptionHandler(EmailCheckException.class)
	public ModelAndView handleEmailCheckException(Exception e, HttpServletRequest req, HttpServletResponse res)
			throws Exception {
		String type = req.getHeader("Accept").split(",")[0];
		String code = "[400]";
		String message = "인증번호가 다릅니다 다시 한 번 확인해주세요.";
		String status = "not_match_email_code";
		logger.error("========================================");
		logger.error("이메일 인증 실패");
		logger.error("========================================");
		logger.error("", e);
		if (type.equals("text/html")) {
			return throwExceptions.jspException(code, message);
		} else {
			throwExceptions.jsonException(code, message, status, res);
			return null;
		}
	}

	@ExceptionHandler(NoMatchPrivateKeyException.class)
	public ModelAndView handleNoMatchPrivateKeyException(Exception e, HttpServletRequest req, HttpServletResponse res)
			throws Exception {
		String type = req.getHeader("Accept").split(",")[0];
		String code = "[400]";
		String message = "개인키가 다릅니다 다시 확인해주세요.";
		String status = "no_match_private_key";
		logger.error("========================================");
		logger.error("개인키 인증 실패");
		logger.error("========================================");
		logger.error("", e);
		if (type.equals("text/html")) {
			return throwExceptions.jspException(code, message);
		} else {
			throwExceptions.jsonException(code, message, status, res);
			return null;
		}
	}

	@ExceptionHandler(NoMatchMemberException.class)
	public ModelAndView handleNoMatchMemberException(Exception e, HttpServletRequest req, HttpServletResponse res)
			throws Exception {
		String type = req.getHeader("Accept").split(",")[0];
		String code = "[400]";
		String message = "회원 정보를 찾을 수 없습니다.";
		String status = "no_match_member";
		logger.error("========================================");
		logger.error("회원 찾기 실패");
		logger.error("========================================");
		logger.error("", e);
		if (type.equals("text/html")) {
			return throwExceptions.jspException(code, message);
		} else {
			throwExceptions.jsonException(code, message, status, res);
			return null;
		}
	}

	@ExceptionHandler(AlreadyEmailException.class)
	public ModelAndView handlealeadyEmailException(Exception e, HttpServletRequest req, HttpServletResponse res)
			throws Exception {
		String type = req.getHeader("Accept").split(",")[0];
		String code = "[400]";
		String message = "이미 존재하는 이메일입니다.";
		String status = "aleady_email_error";
		logger.error("========================================");
		logger.error("이미 존재하는 이메일");
		logger.error("========================================");
		logger.error("", e);
		if (type.equals("text/html")) {
			return throwExceptions.jspException(code, message);
		} else {
			throwExceptions.jsonException(code, message, status, res);
			return null;
		}
	}

	@ExceptionHandler(NoMatchEmailException.class)
	public ModelAndView handlNoMatchEmailException(Exception e, HttpServletRequest req, HttpServletResponse res)
			throws Exception {
		String type = req.getHeader("Accept").split(",")[0];
		String code = "[400]";
		String message = "존재하지 않는 이메일입니다.";
		String status = "no_email_error";
		logger.error("========================================");
		logger.error("존재하지 않는 이메일");
		logger.error("========================================");
		logger.error("", e);
		if (type.equals("text/html")) {
			return throwExceptions.jspException(code, message);
		} else {
			throwExceptions.jsonException(code, message, status, res);
			return null;
		}
	}

	@ExceptionHandler(PassWordException.class)
	public ModelAndView handlPassWordException(Exception e, HttpServletRequest req, HttpServletResponse res)
			throws Exception {
		String type = req.getHeader("Accept").split(",")[0];
		String code = "[400]";
		String message = e.getMessage();
		String status = "no_email_error";
		logger.error("========================================");
		logger.error("비밀번호 유효성 오류");
		logger.error("========================================");
		logger.error("", e);
		if (type.equals("text/html")) {
			return throwExceptions.jspException(code, message);
		} else {
			throwExceptions.jsonException(code, message, status, res);
			return null;
		}
	}

	@ExceptionHandler(PhoneCheckException.class)
	public ModelAndView handlPhoneCheckException(Exception e, HttpServletRequest req, HttpServletResponse res)
			throws Exception {
		String type = req.getHeader("Accept").split(",")[0];
		String code = "[400]";
		String message = "연락처를 확인해주세요.";
		String status = "no_email_error";
		logger.error("========================================");
		logger.error("전화번호 형식 오류");
		logger.error("========================================");
		logger.error("", e);
		if (type.equals("text/html")) {
			return throwExceptions.jspException(code, message);
		} else {
			throwExceptions.jsonException(code, message, status, res);
			return null;
		}
	}

	@ExceptionHandler(DateFilterException.class)
	public ModelAndView handleDateFilterException(Exception e, HttpServletRequest req, HttpServletResponse res)
			throws Exception {
		String type = req.getHeader("Accept").split(",")[0];
		String code = "[400]";
		String message = "데이터 저장 과정에서 오류가 발생하였습니다. 관리자에게 문의해주세요.";
		String status = "bad_sql";
		logger.error("========================================");
		logger.error("날짜필터 에러 발생");
		logger.error("========================================");
		logger.error("", e);
		if (type.equals("text/html")) {
			return throwExceptions.jspException(code, message);
		} else {
			throwExceptions.jsonException(code, message, status, res);
			return null;
		}
	}

	@ExceptionHandler(BadSqlGrammarException.class)
	public ModelAndView handleBadSqlException(Exception e, HttpServletRequest req, HttpServletResponse res)
			throws Exception {
		String type = req.getHeader("Accept").split(",")[0];
		String code = "[400]";
		String message = "데이터 저장 과정에서 오류가 발생하였습니다. 관리자에게 문의해주세요.";
		String status = "bad_sql";
		logger.error("========================================");
		logger.error("SQL 에러 발생");
		logger.error("========================================");
		logger.error("", e);
		if (type.equals("text/html")) {
			return throwExceptions.jspException(code, message);
		} else {
			throwExceptions.jsonException(code, message, status, res);
			return null;
		}
	}

	@ExceptionHandler(NullDataException.class)
	public ModelAndView handleNullDataException(Exception e, HttpServletRequest req, HttpServletResponse res)
			throws Exception {
		String type = req.getHeader("Accept").split(",")[0];
		String code = "[400]";
		String message = "존재하지 않는 데이터 입니다.";
		String status = "bad_param";
		logger.error("========================================");
		logger.error(e.getMessage());
		logger.error("========================================");
		logger.error("", e);
		if (type.equals("text/html")) {
			return throwExceptions.jspException(code, message);
		} else {
			throwExceptions.jsonException(code, message, status, res);
			return null;
		}
	}

	@ExceptionHandler(EssentialException.class)
	public ModelAndView handleEssentialException(Exception e, HttpServletRequest req, HttpServletResponse res)
			throws Exception {
		String type = req.getHeader("Accept").split(",")[0];
		String code = "[400]";
		String message = e.getMessage();
		String status = "Essential_error";
		logger.error("========================================");
		logger.error("필수 정보 누락 혹은 잘못된 값 입력");
		logger.error("========================================");
		logger.error("", e);
		if (type.equals("text/html")) {
			return throwExceptions.jspException(code, message);
		} else {
			throwExceptions.jsonException(code, message, status, res);
			return null;
		}
	}

	@ExceptionHandler(LanguageException.class)
	public ModelAndView handleLanguageException(Exception e, HttpServletRequest req, HttpServletResponse res)
			throws Exception {
		String type = req.getHeader("Accept").split(",")[0];
		String code = "[400]";
		String message = e.getMessage();
		String status = "Language_Error";
		logger.error("========================================");
		logger.error("지정된 언어 미사용");
		logger.error("========================================");
		logger.error("", e);
		if (type.equals("text/html")) {
			return throwExceptions.jspException(code, message);
		} else {
			throwExceptions.jsonException(code, message, status, res);
			return null;
		}
	}

	@ExceptionHandler(FreeTypeException.class)
	public ModelAndView handleFreeTypeException(FreeTypeException e, HttpServletRequest req, HttpServletResponse res)
			throws Exception {
		String type = req.getHeader("Accept").split(",")[0];
		logger.error("========================================");
		logger.error(e.getMessage());
		logger.error("========================================");
		logger.error("", e);
		if (type.equals("text/html")) {
			return throwExceptions.jspException(e.GetCode(), e.getMessage());
		} else {
			throwExceptions.jsonException(e.GetCode(), e.getMessage(), e.GetStatus(), res);
			return null;
		}
	}

	@ExceptionHandler(NumberFormatException.class)
	public ModelAndView handleNumberFormatException(Exception e, HttpServletRequest req, HttpServletResponse res)
			throws Exception {
		String type = req.getHeader("Accept").split(",")[0];
		String code = "[400]";
		String message = "잘못된 접근입니다.";
		String status = "bad_param";
		logger.error("========================================");
		logger.error("잘못된 값이 입력됨");
		logger.error("========================================");
		logger.error("", e);
		if (type.equals("text/html")) {
			return throwExceptions.jspException(code, message);
		} else {
			throwExceptions.jsonException(code, message, status, res);
			return null;
		}
	}

	@ExceptionHandler({ NullPointerException.class, IllegalArgumentException.class })
	public ModelAndView handleBadParamException(Exception e, HttpServletRequest req, HttpServletResponse res)
			throws Exception {
		String type = req.getHeader("Accept").split(",")[0];
		String code = "[400]";
		String message = e.getMessage() != null && !e.getMessage().trim().isEmpty() ? e.getMessage() : "잘못된 접근입니다.";
		String status = "bad_param";
		logger.error("========================================");
		logger.error("잘못된 값이 입력됨");
		logger.error("========================================");
		logger.error("", e);
		if (type.equals("text/html")) {
			return throwExceptions.jspException(code, message);
		} else {
			throwExceptions.jsonException(code, message, status, res);
			return null;
		}
	}

	@ExceptionHandler({ MaxUploadSizeExceededException.class, SizeLimitExceededException.class })
	public ModelAndView handleMaxUploadSizeExceededException(Exception e, HttpServletRequest req,
			HttpServletResponse res) throws Exception {
		String type = req.getHeader("Accept").split(",")[0];
		String code = "[400]";
		String message = "리포트 파일은 10MB 이하만 등록 가능합니다.";
		String status = "file_to_big";
		logger.error("========================================");
		logger.error("업로드 가능 용량 초과");
		logger.error("========================================");
		logger.error("", e);
		if (type.equals("text/html")) {
			return throwExceptions.jspException(code, message);
		} else {
			throwExceptions.jsonException(code, message, status, res);
			return null;
		}
	}

	@ExceptionHandler(IOException.class)
	public ModelAndView handleIOException(IOException e, HttpServletRequest req) {
		if (!e.getClass().getName().equals("org.apache.catalina.connector.ClientAbortException")) {
			logger.error("Client aborted the connection", e);
			return null;
		}
		String code = "[400]";
		String message = e.getMessage();
		logger.error("========================================");
		logger.error("ajax 요청 응답 과정에서 에러 발생");
		logger.error("========================================");
		logger.error("", e);
		return throwExceptions.jspException(code, message);
	}

//	@ExceptionHandler(MissingServletRequestPartException.class)
//	public ModelAndView handleMissingServletRequestPartException(Exception e, HttpServletRequest req,
//			HttpServletResponse res) throws IOException {
//		logger.error("필수값 누락 [ 파일 ]", e);
//		String type = req.getHeader("Accept").split(",")[0];
//		if (type.equals("text/html")) {
//			ModelAndView model = new ModelAndView("/common/error");
//			model.addObject("code", "[400]");
//			model.addObject("message", "필수값을 입력해주세요 [종자 이미지, 식물이미지].");
//			return model;
//		} else {
//			JSONObject jsonObject = new JSONObject();
//			jsonObject.put("code", "[500]");
//			jsonObject.put("status", "error");
//			jsonObject.put("message", "필수값을 입력해주세요 [종자 이미지, 식물이미지].");
//			res.setCharacterEncoding("UTF-8");
//			res.setContentType("application/json");
//			res.getWriter().print(jsonObject);
//			return null;
//		}
//	}

	@ExceptionHandler(Exception.class)
	public ModelAndView handleException(Exception e, HttpServletRequest req, HttpServletResponse res) throws Exception {

		String type = req.getHeader("Accept").split(",")[0];
		String code = "[500]";
		String message = "알 수 없는 이유로 오류가 발생하였습니다. 관리자에게 문의해주세요.";
		String status = "error";
		logger.error("========================================");
		logger.error("알 수 없는 이유로 에러 발생");
		logger.error("========================================");
		logger.error("", e);
		if (type.equals("text/html")) {
			return throwExceptions.jspException(code, message);
		} else {
			throwExceptions.jsonException(code, message, status, res);
			return null;
		}
	}

	@ExceptionHandler(RoleException.class)
	public ModelAndView RoleException(Exception e, HttpServletRequest req, HttpServletResponse res) throws Exception {
		String type = req.getHeader("Accept").split(",")[0];
		String code = "[500]";
		String message = e.getMessage();
		String status = "failed_link";
		logger.error("========================================");
		logger.error("권한에서 벗어난 기능 실행");
		logger.error("========================================");
		logger.error("", e);
		if (type.equals("text/html")) {
			return throwExceptions.jspException(code, message);
		} else {
			throwExceptions.jsonException(code, message, status, res);
			return null;
		}
	}

}
