package com.vanessa.ArtPorfolio.Services;

//import java.io.IOException;
import java.util.Optional;
import java.util.stream.Stream;

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
	public Stream<Art> allArt() {
		return artRepo.findAll().stream();
	}

//	Create one art work
//	public Art saveArt(MultipartFile file) throws IOException {
//		String fileName = StringUtils.cleanPath(file.getOriginalFilename());
//		Art artFile = new Art(fileName, file.getContentType(), file.getBytes());
//		return artRepo.save(artFile);
//	}

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
