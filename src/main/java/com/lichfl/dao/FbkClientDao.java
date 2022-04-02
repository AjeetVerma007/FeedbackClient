package com.lichfl.dao;

import java.util.List;

import com.lichfl.model.Query;

public interface FbkClientDao {
	
	public List<Query> fetchQueries(String loginId, String status);

}
