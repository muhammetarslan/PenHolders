package com.fatih.demo.repository;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.fatih.demo.model.Content;

public interface ContentRepository extends JpaRepository<Content, Long>{
	
	@Transactional
	@Modifying
	@Query(value="update content c set c.content = :newContent where c.content_title = :contentTitle And c.id= :idX", nativeQuery=true)
	void edit(@Param("contentTitle") String contentTitle,@Param("newContent") String newContent,@Param("idX")String userId);
	
//	@Query(value="select * from content c where c.content_title = :contentTitle")
//	List<Content> findContentByTitle(@Param("contentTitle")String contentTitle);
	
}
