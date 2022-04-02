package com.lichfl.config;

import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionManager;
import org.springframework.transaction.annotation.TransactionManagementConfigurer;

@Configuration
@ComponentScan({"com.lichfl"})
public class FbkClientConfig implements TransactionManagementConfigurer {
	  
	@Bean
    public DataSource dataSource() {
        DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setDriverClassName("oracle.jdbc.driver.OracleDriver");
        dataSource.setUrl("jdbc:oracle:thin:@//10.21.2.101:1521/LICHFLDBTEST");
        dataSource.setUsername("testserver");
        dataSource.setPassword("testserver1");

        return dataSource;
    }	
	@Bean
	public JdbcTemplate jdbcTemplate() {
		return new JdbcTemplate(dataSource());
	}

	
	
	@Bean
	public PlatformTransactionManager txManager() {
		return new DataSourceTransactionManager(dataSource());
	}
	
	/**
	 * Configuring the transaction manager
	 */
	@Override
    public PlatformTransactionManager annotationDrivenTransactionManager() {
        return txManager();
    }

}
