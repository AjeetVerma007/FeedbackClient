package com.lichfl.model;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Component
@Scope("prototype")
@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class Query {
	
	private Long id;
	private String userName;
	private String officeName;
	private String module;
	private String subModule;
	private String assignedOn;
	private String status;
	

}
