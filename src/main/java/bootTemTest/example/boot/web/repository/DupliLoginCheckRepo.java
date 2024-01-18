package bootTemTest.example.boot.web.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import bootTemTest.example.boot.web.domain.DupliLogingCheck;

public interface DupliLoginCheckRepo extends JpaRepository<DupliLogingCheck, Long>{
	DupliLoginCheckRepo findBymbNo(Long mbNo);
}
