package com.omfys.crm.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.omfys.crm.model.MainMenu;

@Repository
public interface MainMenuRepository extends JpaRepository<MainMenu, Integer> {
	
	@Override
	public List<MainMenu> findAll();
	
	public List<MainMenu> findByOrderByMainmenuidAsc();
	
//	@Query(value="SELECT * FROM CRM_MAIN_MENU WHERE PROFILE_ID = ?1 ORDER BY MAIN_MENU_ID",nativeQuery = true)
//	public List<MainMenu> findMainMenuForemployee(int profileid);
	
	@Query(value="SELECT * FROM CRM_MAIN_MENU WHERE ROLEISACTIVATED = 'Y' AND CRM_USER_TYPE = ?1 ORDER BY MAIN_MENU_ID",nativeQuery = true)
	public List<MainMenu> findMainMenuForemployee(String userType);
	
	@Query(value="SELECT * FROM CRM_MAIN_MENU WHERE ROLEISACTIVATED = 'Y' AND CRM_USER_TYPE = ?1 AND EMPID = ?2 ORDER BY MAIN_MENU_ID",nativeQuery = true)
	public List<MainMenu> findMainMenuForAdmin(String userType,int empid);

}
