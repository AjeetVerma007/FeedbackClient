package com.lichfl.daoImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.SqlOutParameter;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.lichfl.dao.FbkClientDao;
import com.lichfl.model.Query;

import oracle.jdbc.internal.OracleTypes;

@Repository
public class FbkClientDaoImpl implements FbkClientDao {
	
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	private MessageSource messageSource;

	@SuppressWarnings("unchecked")
	@Override
	@Transactional(transactionManager="txManager", readOnly=true)
	public List<Query> fetchQueries(String loginId, String status) {
		
		SimpleJdbcCall  jdbcCall = new SimpleJdbcCall(jdbcTemplate)
				.withCatalogName("PKG_FBK_CLIENT")
				.withProcedureName("PR_FETCH_QUERIES")
				.declareParameters(new SqlOutParameter("out_query_data", OracleTypes.CURSOR, new BeanPropertyRowMapper<>(Query.class)));
		
		SqlParameterSource in = new MapSqlParameterSource()
								.addValue("in_login_id", loginId)
								.addValue("in_status", status);
		
		
		Map<String,Object> out=jdbcCall.execute(in);
		String errorMsg = (String) out.get("OUT_ERR_MSG");
		if(!"success".equalsIgnoreCase(errorMsg))
		{
			throw new RuntimeException(errorMsg);
		}
		
		System.out.println((List<Query>) out.get("out_query_data"));
		return (List<Query>) out.get("out_query_data");
	}

}
