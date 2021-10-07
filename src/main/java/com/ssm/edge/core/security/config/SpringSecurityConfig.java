package com.ssm.edge.core.security.config;

import javax.annotation.Resource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.configuration.EnableGlobalAuthentication;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.web.firewall.DefaultHttpFirewall;
import org.springframework.security.web.firewall.HttpFirewall;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import com.ssm.edge.core.security.handler.AuthFailureHandler;
import com.ssm.edge.core.security.handler.AuthSuccessHandler;
import com.ssm.edge.core.security.provider.AuthProvider;


@Configuration
@EnableWebSecurity
@EnableGlobalAuthentication
@ComponentScan(basePackages = {"com.ssm.edge.*"})
public class SpringSecurityConfig extends WebSecurityConfigurerAdapter {
    
	@Resource(name = "authProvider")
    AuthProvider authProvider;
    
	@Resource(name = "authFailureHandler")
    AuthFailureHandler authFailureHandler;
 
	@Resource(name = "authSuccessHandler")
    AuthSuccessHandler authSuccessHandler;
    
	@Bean
	public HttpFirewall allowUrlEncodedSlashHttpFirewall() {
	    DefaultHttpFirewall firewall = new DefaultHttpFirewall();
	    firewall.setAllowUrlEncodedSlash(true);
	    return firewall;
	}
 
    @Override
    public void configure(WebSecurity web) throws Exception {
    	web.httpFirewall(allowUrlEncodedSlashHttpFirewall());
    	web.ignoring().antMatchers("/resources/**");
    	
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests()
        	.antMatchers("/core/error/**",
					"/core/exceptionHandling/**",
					"/core/login/**").permitAll()
			.antMatchers("/core/main/**").hasAnyAuthority("ROLE_GUEST", "ROLE_USER", "ROLE_ADMIN", "ROLE_SYSTEM")
			.antMatchers("/turck/admin/**").hasAnyAuthority("ROLE_ADMIN", "ROLE_SYSTEM")
			.antMatchers("/core/system/**").hasAuthority("ROLE_SYSTEM")
            .antMatchers("/**").authenticated();

        http.formLogin()
            .loginPage("/core/login")
            .loginProcessingUrl("/core/login/userLogin")
            .failureHandler(authFailureHandler)
            .successHandler(authSuccessHandler)
            .usernameParameter("userId")
            .passwordParameter("userPassword")
            .permitAll();

        http.logout().logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
            .logoutSuccessUrl("/core/login")
            .invalidateHttpSession(true);
        
        http.csrf();
        
        http.sessionManagement()
        	.maximumSessions(1)
        	.maxSessionsPreventsLogin(false)
        	.expiredUrl("/core/login");
        	// .expiredSessionStrategy(securitySessionExpiredStrategy.setDefaultUrl("/caution/session_out.html"));
        
        http.authenticationProvider(authProvider);
    }
}