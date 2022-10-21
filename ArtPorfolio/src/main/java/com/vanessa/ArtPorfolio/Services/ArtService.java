package com.vanessa.ArtPorfolio.Services;

import java.util.List;
//import java.io.IOException;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
//import org.springframework.util.StringUtils;
//import org.springframework.web.multipart.MultipartFile;

import com.vanessa.ArtPorfolio.Models.Art;
import com.vanessa.ArtPorfolio.Repos.ArtRepo;

@Service
public class ArtService {
	@Autowired
	private final ArtRepo artRepo;

//	Adding Dependency
	public ArtService(ArtRepo artRepo) {
		this.artRepo = artRepo;
	}

//	Get all art works
	public List<Art> allArt() {
		return artRepo.findAll();
	}

// Create One Art Work
	public Art makeArt(Art art) {
		return artRepo.save(art);
	}

//	Get all the art of one user
	public Art getArt(Long id) {
		Optional<Art> optionalArt = artRepo.findById(id);
		return optionalArt.isPresent() ? optionalArt.get() : null;
	}

//	Update one art work
	public Art updateArt(Art art) {
		Art updateArt = artRepo.save(art);
		return updateArt;
	}

//	Delete one art work
	public void deleteArt(Long id) {
		artRepo.deleteById(id);
	}
}
