package com.omfys.crm.Repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.omfys.crm.model.Crm_Sub_Menu;
import com.omfys.crm.model.MainMenu;

public interface SubmenuRepository extends JpaRepository<Crm_Sub_Menu, Integer> {

	@Query(value="SELECT *FROM CRM_SUB_MENU WHERE MAIN_MENU_ID=?1 ORDER BY SUB_MENU_ID",nativeQuery = true)
	public List<Crm_Sub_Menu> findSubManu(int main_manu_id);
	
	
	
}
