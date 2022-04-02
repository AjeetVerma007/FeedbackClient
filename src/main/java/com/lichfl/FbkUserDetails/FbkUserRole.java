package com.lichfl.FbkUserDetails;

import java.util.List;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Component
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class FbkUserRole {
	
	private String srno ; 
	private List<String> role;
	
	
}