package com.wilsonbluong.javaproject.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.wilsonbluong.javaproject.models.Song;
import com.wilsonbluong.javaproject.repositories.SongRepository;

@Service
public class SongService {
	
	private final SongRepository songRepository;

	public SongService(SongRepository songRepository) {
		this.songRepository = songRepository;
	}
	
	public List<Song> allSongs() {
		return songRepository.findAll();
	}

	public Song findSong(Long id) {
		Optional<Song> optionalSong = songRepository.findById(id);
        if(optionalSong.isPresent()) {
            return optionalSong.get();
        }
        else {
            return null;
        }
	}
	
	public Song addSong(Song song) {
		return songRepository.save(song);
	}
	
	public void deleteSong(Long id) {
		songRepository.deleteById(id);
	}
}
