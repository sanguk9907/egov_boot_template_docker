package bootTemTest.example.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;

@Configuration
@Import({
	EgovConfigAspect.class,
	EgovConfigCommon.class,
	EgovConfigIdGeneration.class,
	EgovConfigProperties.class,
	EgovConfigTransaction.class,
	EgovConfigQueryDsl.class,
	EgovConfigSecurity.class,
	EgovConfigCors.class,
	EgovConfigMailSender.class
})
public class EgovConfig {
}
