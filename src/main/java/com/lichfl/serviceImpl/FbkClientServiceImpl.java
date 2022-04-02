package com.lichfl.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lichfl.dao.FbkClientDao;
import com.lichfl.model.Query;
import com.lichfl.service.FbkClientService;

@Service
public class FbkClientServiceImpl implements FbkClientService {

	@Autowired
	private FbkClientDao fbkClientDao;
	

	@Override
	public List<Query> getQueries(String loginId, String status) {
		// TODO Auto-generated method stub
		return fbkClientDao.fetchQueries(loginId, status);
	}

}
