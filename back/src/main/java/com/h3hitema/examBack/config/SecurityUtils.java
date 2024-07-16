package com.h3hitema.examBack.config;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.ArrayList;
import java.util.List;

public final class SecurityUtils {

	private SecurityUtils() {
	}

	/**
	 * Get the login of the current user.
	 *
	 * @return the login of the current user
	 */
	public static String getCurrentUserLogin() {
		SecurityContext securityContext = SecurityContextHolder.getContext();
		Authentication authentication = securityContext.getAuthentication();
		String userName = null;
		if (authentication != null) {
			if (authentication.getPrincipal() instanceof UserDetails) {
				UserDetails springSecurityUser = (UserDetails) authentication.getPrincipal();
				userName = springSecurityUser.getUsername();
			} else if (authentication.getPrincipal() instanceof String) {
				userName = (String) authentication.getPrincipal();
			}
		}
		return userName;

	}

	/**
	 * Check if a user is authenticated.
	 *
	 * @return true if the user is authenticated, false otherwise
	 */
	public static boolean isAuthenticated() {
		SecurityContext securityContext = SecurityContextHolder.getContext();
		Authentication authentication = securityContext.getAuthentication();
		return authentication != null;
	}

	/**
	 * Check if a user has a role.
	 *
	 * @return true if the user has the role
	 */
	public static boolean hasRole(String role) {
		if (!role.startsWith("ROLE_"))
			role = "ROLE_" + role;

		SecurityContext securityContext = SecurityContextHolder.getContext();
		return securityContext.getAuthentication().getAuthorities().contains(new SimpleGrantedAuthority(role));
	}

	/**
	 * Check if a user has one of many role.
	 *
	 * @return true if the user has one of many role
	 */
	public static boolean hasAnyRole(String... roles) {
		for (String role : roles)
			if (hasRole(role))
				return true;
		return false;
	}

	/**
	 * Return the permission of the user for a given module
	 *
	 * @return a list of permission
	 */
	public static List<Permission> getPermissions(String module) {
		SecurityContext securityContext = SecurityContextHolder.getContext();
		List<Permission> permissions = new ArrayList<>();
		for (GrantedAuthority g : securityContext.getAuthentication().getAuthorities()) {
			String[] split = g.getAuthority().split("_");
			if (split.length < 2 || !split[0].equals(module))
				continue;
			Permission permission = new Permission();
			permission.setPermission(split[1]);
			permission.setScope(split.length == 2 ? null : split[2]);
			permissions.add(permission);
		}
		return permissions;
	}

}
