package com.omfys.crm.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.omfys.crm.model.Crm_Sub_Sub_Menu;
import com.omfys.crm.model.Main_Territory;

public interface SubSubMenuRepository extends JpaRepository<Crm_Sub_Sub_Menu, Integer>{

	@Query(value = "SELECT *FROM CRM_SUB_SUB_MENU WHERE MAIN_MENU_ID=?1 AND SUB_MENU_ID=?2 ORDER BY SUB_SUB_MENU_ID",nativeQuery = true)
	public List<Crm_Sub_Sub_Menu> findSubSubMenu(int main_menu_id, int sub_menu_id);
	
}
