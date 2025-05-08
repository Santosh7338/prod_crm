package com.omfys.crm.Repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.omfys.crm.model.CrmDataSource;

public interface CrmDataSourceRepository extends JpaRepository<CrmDataSource, Integer> {
	
	public CrmDataSource findByCrmdsid(int crmdsid);
	
	public List<CrmDataSource> findByOrderByDatasourceAsc();
	
	@Query(value="SELECT * FROM CRMDATASOURCE WHERE IS_ACTIVATED = 'Y' order by crmdsid",nativeQuery = true)
	public List<CrmDataSource> findActivatedDatasourceByOrderByCrmdsidAsc();

}
