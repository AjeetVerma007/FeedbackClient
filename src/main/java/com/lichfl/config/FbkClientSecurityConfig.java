package com.lichfl.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.ldap.authentication.ad.ActiveDirectoryLdapAuthenticationProvider;
import org.springframework.security.ldap.userdetails.InetOrgPersonContextMapper;

@Configuration
@ComponentScan({ "com.lichfl" })
@EnableWebSecurity
public class FbkClientSecurityConfig extends WebSecurityConfigurerAdapter {
	// new code added for roles authentication
	/*
	 * @Bean public UserDetailsService userDetailsService() { return new
	 * FbkClientUserDetailsServiceImpl(); }
	 * 
	 * @Bean public BCryptPasswordEncoder passwordEncoder() { return new
	 * BCryptPasswordEncoder(); }
	 */

	// ----end of new code
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests()// ----new code added admin
				.antMatchers("/", "/error", "/resources/**").permitAll().anyRequest().authenticated().and().formLogin()
				.usernameParameter("username").passwordParameter("password").loginPage("/")
				.loginProcessingUrl("/validate").defaultSuccessUrl("/welcome").failureUrl("/error").and().logout()
				.deleteCookies("JSESSIONID").invalidateHttpSession(true).logoutSuccessUrl("/").permitAll().and()
				.exceptionHandling().accessDeniedPage("/403").and().sessionManagement().sessionFixation()
				.migrateSession().sessionCreationPolicy(SessionCreationPolicy.IF_REQUIRED).maximumSessions(1)
				.maxSessionsPreventsLogin(true).expiredUrl("/sessionout");
//.antMatchers("/admin").hasAuthority("ADMIN")
		http.headers().frameOptions().sameOrigin();
	}

	// new code added for roles authentication
	/*
	 * @Bean public DaoAuthenticationProvider authenticationProvider() {
	 * DaoAuthenticationProvider authProvider2 = new DaoAuthenticationProvider();
	 * authProvider2.setUserDetailsService(userDetailsService());
	 * authProvider2.setPasswordEncoder(passwordEncoder());
	 * 
	 * return authProvider2; }
	 */
	// ---end of new code ---------------------------

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.authenticationProvider(authProvider());
		// new code added for roles authentication
		//auth.authenticationProvider(authenticationProvider());

	}

	@Bean
	public AuthenticationProvider authProvider() {
		ActiveDirectoryLdapAuthenticationProvider authProvider = new ActiveDirectoryLdapAuthenticationProvider(
				"HFLHO.com", // domain
				"ldap://10.0.0.57:389", // URL
				"dc=HFLHO,dc=com"); // Root DN
		authProvider.setUserDetailsContextMapper(userDetailsContextMapper());

		return authProvider;
	}

	@Bean
	public InetOrgPersonContextMapper userDetailsContextMapper() {
		return new InetOrgPersonContextMapper();
	}

}
