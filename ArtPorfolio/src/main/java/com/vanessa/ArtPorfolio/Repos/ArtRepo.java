package com.vanessa.ArtPorfolio.Repos;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.vanessa.ArtPorfolio.Models.Art;

@Repository
public interface ArtRepo extends CrudRepository<Art, Long> {
	List<Art> findAll();
}
