package com.wilsonbluong.javaproject.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.wilsonbluong.javaproject.models.Song;

@Repository
public interface SongRepository extends CrudRepository<Song, Long> {
	
	List<Song> findAll();
	
	List<Song> findByArtist(String artist);


}
