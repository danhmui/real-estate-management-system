package com.javaweb.config;

import com.javaweb.security.CustomSuccessHandler;
import com.javaweb.service.impl.CustomUserDetailService;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import java.lang.reflect.Method;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

    @Bean
    public UserDetailsService userDetailsService() {
        return new CustomUserDetailService();
    }

    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public DaoAuthenticationProvider authenticationProvider() {
        DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();
        authProvider.setUserDetailsService(userDetailsService());
        authProvider.setPasswordEncoder(passwordEncoder());
        return authProvider;
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) {
        auth.authenticationProvider(authenticationProvider());
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
                http.csrf().disable()
                .authorizeRequests()
                        //Phan quyen cho toa nha
                        .antMatchers(HttpMethod.DELETE, "/api/admin/building-list/**").hasRole("MANAGER")
                        .antMatchers("/api/admin/building-edit/**").hasAnyRole("MANAGER", "STAFF")
                        .antMatchers("/api/admin/buildings/{id}/staffs").hasRole("MANAGER")
                        .antMatchers("/api/admin/buildingassignments").hasRole("MANAGER")
                        //Phan quyen cho khach hang
                        .antMatchers(HttpMethod.DELETE,"/api/admin/customer-list/**").hasRole("MANAGER")
                        .antMatchers("/api/admin/customerassignments").hasRole("MANAGER")
                        .antMatchers("/api/admin/customers/{id}/staffs").hasRole("MANAGER")
                        .antMatchers("/api/admin/customer-edit/**").hasAnyRole("MANAGER", "STAFF")
                        .antMatchers("/api/admin/**").hasAnyRole("MANAGER", "STAFF")

                        .antMatchers("/api/user/change-password/**").hasAnyRole("MANAGER", "STAFF")
                        .antMatchers("/api/user/profile/**").hasAnyRole("MANAGER", "STAFF")
                        .antMatchers("/api/user/**").hasRole("MANAGER")
                        .antMatchers("/register", "/login", "/resource/**", "/trang-chu").permitAll()
                        .antMatchers("/api/**").authenticated()
                        .anyRequest().authenticated()
                        .and()
                .formLogin().loginPage("/login").usernameParameter("j_username").passwordParameter("j_password").permitAll()
                .loginProcessingUrl("/j_spring_security_check")
                .successHandler(myAuthenticationSuccessHandler())
                .failureUrl("/login?incorrectAccount").and()
                .logout().logoutUrl("/logout").deleteCookies("JSESSIONID")
                .and().exceptionHandling().accessDeniedPage("/access-denied").and()
                .sessionManagement().maximumSessions(1).expiredUrl("/login?sessionTimeout");
    }

    @Bean
    public AuthenticationSuccessHandler myAuthenticationSuccessHandler(){
        return new CustomSuccessHandler();
    }
}
