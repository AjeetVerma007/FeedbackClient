package com.lichfl.service;

import java.util.List;

import com.lichfl.model.Query;

public interface FbkClientService {
	
	
	public List<Query> getQueries(String loginId, String status);

}
