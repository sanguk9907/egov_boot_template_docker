package bootTemTest.util.helper;

import java.io.File;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import bootTemTest.CustomException.DateFilterException;

@Component
public class Helper {

	private static final Logger LOGGER = LoggerFactory.getLogger(Helper.class);

	/**
	 * HttpServletRequest로 들어온 값을 HashMap 형식으로 변환, key값에 특수문자 있는지 검증
	 * 
	 * @param req : 클라이언트단에서 받은 값
	 * @return : HashMap형식으로 변환한 HttpServletRequest
	 * @throws Exception
	 */
	public HashMap<String, Object> convertReqToHashMap(HttpServletRequest req) throws Exception {
		HashMap<String, Object> result = new HashMap<String, Object>();
		Enumeration<String> enumber = req.getParameterNames();

		if (!enumber.hasMoreElements()) {
			LOGGER.info(" ");
			LOGGER.info("======================= no parameter =========================");
		} else {
			LOGGER.info(" ");
			LOGGER.info("=================ConvertReqToHashMap START====================");
			while (enumber.hasMoreElements()) {

				String key = enumber.nextElement().toString().trim();
				String value = req.getParameter(key).trim();
				String short_val = value.length() <= 15 ? value : value.substring(0, 15) + "...";
				LOGGER.info(key + " : " + short_val);
				String[] BanString = { "\'", "\"", "=", "&", "|", "!", "(", ")", "{", "}", "$", "%", "@" };
				boolean isExist = Arrays.stream(BanString).anyMatch(key::contains);
				if (isExist) {
					LOGGER.error("비정상적인 접근이 발견되었습니다 ( " + key + " )");
					LOGGER.info("=================ConvertReqToHashMap END====================");
					throw new IllegalArgumentException("잘못된 접근입니다.");
				}

				if (!value.isEmpty()) {
					result.put(key, value);
				}
			}
			LOGGER.info("=================ConvertReqToHashMap END======================");
		}
		return result;
	}

	/**
	 * 시리얼라이즈 된 form 데이터를 HashMap 형식으로 변환, key값에 특수문자 있는지 검증
	 * 
	 * @param serial : 클라이언트단에서 받은 폼 시리얼라이즈
	 * @return : HashMap
	 * @throws Exception
	 */
	public HashMap<String, Object> convertSerialToHashMap(String serial) throws Exception {
		String decodedUrlParams = URLDecoder.decode(serial, "UTF-8");
		String[] paramPairs = decodedUrlParams.split("&");
		HashMap<String, Object> result = new HashMap<>();
		String[] BanString = { "\'", "\"", "=", "&", "|", "!", "(", ")", "{", "}", "$", "%", "@" };
		LOGGER.info("=================ConvertSerialToHashMap START====================");
		for (String paramPair : paramPairs) {
			String[] keyValue = paramPair.split("=");
			if (keyValue.length == 2) {
				String key = keyValue[0];
				String value = keyValue[1];
				String short_val = value.length() <= 15 ? value : value.substring(0, 15) + "...";
				boolean isExist = Arrays.stream(BanString).anyMatch(key::contains);
				if (isExist) {
					LOGGER.error("비정상적인 접근이 발견되었습니다 ( " + key + " )");
					LOGGER.info("=================ConvertSerialToHashMap END====================");
					throw new IllegalArgumentException("잘못된 접근입니다.");
				}
				LOGGER.info(key + " : " + short_val);
				result.put(key, value.trim());
			} else if (keyValue.length == 1) {
				String key = keyValue[0];
				String value = null;
				boolean isExist = Arrays.stream(BanString).anyMatch(key::contains);
				if (isExist) {
					LOGGER.error("비정상적인 접근이 발견되었습니다 ( " + key + " )");
					LOGGER.info("=================ConvertSerialToHashMap END====================");
					throw new IllegalArgumentException("잘못된 접근입니다.");
				}
				LOGGER.info(key + " : " + value);
				result.put(key, value);
			}
		}
		LOGGER.info("=================ConvertSerialToHashMap END====================");
		return result;
	}

	/**
	 * 시리얼라이즈 된 form 데이터를 메타데이터 형식에 맞게 변환한 HashMap, key값에 특수문자 있는지 검증
	 * 
	 * @param serial : 클라이언트단에서 받은 메타데이터 폼 시리얼라이즈
	 * @return : 메타데이터 형식으로 만든 HashMap
	 * @throws Exception
	 */
	private HashMap<String, Object> convertSerialToHashMapForMetadata(String serial) throws Exception {
		String decodedUrlParams = URLDecoder.decode(serial, "UTF-8");
		String[] paramPairs = decodedUrlParams.split("&");
		HashMap<String, Object> result = new HashMap<>();
		String intro_zip = "";
		String intro_addr1 = "";
		String intro_addr2 = "";
		LOGGER.info("=================convertSerialToHashMapForMetadata START====================");
		for (String paramPair : paramPairs) {
			String[] keyValue = paramPair.split("=");
			if (keyValue.length == 2) {
				String key = keyValue[0];
				String value = keyValue[1];
				String short_val = value.length() <= 15 ? value : value.substring(0, 15) + "...";
				String[] BanString = { "\'", "\"", "=", "&", "|", "!", "(", ")", "{", "}", "$", "%", "@" };
				boolean isExist = Arrays.stream(BanString).anyMatch(key::contains);
				if (isExist) {
					LOGGER.error("비정상적인 접근이 발견되었습니다 ( " + key + " )");
					LOGGER.info("=================convertSerialToHashMapForMetadata END====================");
					throw new IllegalArgumentException("잘못된 접근입니다.");
				}
				LOGGER.info(key + " : " + short_val);
				if (key.equals("intro_zip") && value != null && !value.trim().isEmpty()) {
					intro_zip = value;
				} else if (key.equals("intro_addr1") && value != null && !value.trim().isEmpty()) {
					intro_addr1 = "|" + value;
				} else if (key.equals("intro_addr2") && value != null && !value.trim().isEmpty()) {
					intro_addr2 = "|" + value;
				} else {
					result.put(key, value);
				}
			}
		}
		String intro_addr = (intro_zip + intro_addr1 + intro_addr2);
		LOGGER.info("=================convertSerialToHashMapForMetadata END====================");
		result.put("intro_addr", intro_addr);
		return result;
	}

	/**
	 * MultipartFile 형식의 이미지 파일을 저장
	 * 
	 * @param req  : HttpServletRequest
	 * @param file : MultipartFile 형식의 이미지 파일
	 * @return : 이미지 저장 경로
	 * @throws Exception
	 */
	public String ImageUpload(HttpServletRequest req, MultipartFile file, String type) throws Exception {
		String path = req.getSession().getServletContext().getRealPath("/upload/") + type + "/";
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String fileExtension = "." + FilenameUtils.getExtension(file.getOriginalFilename());
		fileExtension = fileExtension.equals(".jpeg") ? ".jpg" : fileExtension;
		File Folder = new File(path);
//		Set<String> allowedExtensions = new HashSet<>(Arrays.asList(".jpg", ".png", ".jpeg", ".mp4"));
//		if (!allowedExtensions.contains(fileExtension.toLowerCase())) {
//			LOGGER.error("허용되지 않는 파일입니다. ( " + fileExtension + " )");
//			throw new IllegalArgumentException("허용되지 않는 파일입니다. ( " + fileExtension + " )");
//		}

		if (!Folder.exists()) {
			Folder.mkdir();
		}
		String uniqueName = type + "_" + simpleDateFormat.format(System.currentTimeMillis());
		String saveFile = path + uniqueName + fileExtension;
		FileUtils.writeByteArrayToFile(new File(saveFile), file.getBytes());
		String domain = req.getScheme() + "://" + req.getServerName();
		return domain + "/upload/" + type + "/" + uniqueName + fileExtension;
	}

	/**
	 * MultipartFile 형식의 이미지 파일을 저장
	 * 
	 * @param req     : HttpServletRequest
	 * @param pdfFile : MultipartFile 형식의 pdf 파일
	 * @return : 파일 저장 경로
	 * @throws Exception
	 */
	public String savePdfFile(HttpServletRequest req, MultipartFile file) throws Exception {
		String reportPath = req.getSession().getServletContext().getRealPath("/upload/report/");
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		File reportFolder = new File(reportPath);
		String fileExtension = "." + FilenameUtils.getExtension(file.getOriginalFilename());

		if (!reportFolder.exists()) {
			reportFolder.mkdir();
		}

		String uniqueName = "report_" + simpleDateFormat.format(System.currentTimeMillis());
		String saveFile = reportPath + uniqueName + ".pdf";

		FileUtils.writeByteArrayToFile(new File(saveFile), file.getBytes());
		String domain = req.getScheme() + "://" + req.getServerName();
		return domain + "/upload/report/" + uniqueName + fileExtension;
	}

	/**
	 * 각종 리스트 페이지의 기간지정 검색시 시작, 종료일자 유효성 검증
	 * 
	 * @param req : 클라이언트단에서 받은 값
	 * @throws Exception
	 */
	public void dateFilterCheck(HttpServletRequest req) throws Exception {
		if (req.getParameter("filter_date") != null && req.getParameter("filter_date").equals("기간지정")) {
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
			if (req.getParameter("date_start") == null || req.getParameter("date_start").isEmpty()) {
				throw new DateFilterException("시작일자를 입력해주세요.");
			} else if (req.getParameter("date_end") == null || req.getParameter("date_end").isEmpty()) {
				throw new DateFilterException("종료일자를 입력해주세요.");
			} else if (simpleDateFormat.parse(req.getParameter("date_end"))
					.before(simpleDateFormat.parse(req.getParameter("date_start")))) {
				throw new DateFilterException("종료날짜는 시작날짜보다 이전일 수 없습니다.");
			}
		}
	}

	public PaginationInfo createPagenation(String pageNo) {
		if (pageNo == null || pageNo.equals("")) {
			pageNo = "1";
		}

		PaginationInfo pageInfo = new PaginationInfo();
		pageInfo.setCurrentPageNo(Integer.parseInt(pageNo));
		pageInfo.setPageSize(10);
		pageInfo.setRecordCountPerPage(20);
		return pageInfo;
	}

	public boolean CheckParam(String[] arr, String target) {
		return Arrays.asList(arr).contains(target);
	}
}
