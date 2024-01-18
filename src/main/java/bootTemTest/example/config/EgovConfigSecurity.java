package bootTemTest.example.config;

import javax.servlet.DispatcherType;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
@EnableMethodSecurity
public class EgovConfigSecurity {

	@Bean
	public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
		http.csrf().disable().cors();
		http.authorizeHttpRequests((request)->{
			request.dispatcherTypeMatchers(DispatcherType.FORWARD).permitAll()
			.anyRequest().permitAll();
		}).formLogin((login)->{
			login.loginPage("/member/login")
			.loginProcessingUrl("/login")
			.usernameParameter("id")
			.passwordParameter("pwd")
			.defaultSuccessUrl("/",true);
		})
		.logout((logout)->{
			logout.invalidateHttpSession(true)
			.deleteCookies("JSESSIONID");
		});
		
		return http.build();
	}
}
