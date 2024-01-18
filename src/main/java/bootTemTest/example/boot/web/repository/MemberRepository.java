package bootTemTest.example.boot.web.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import bootTemTest.example.boot.web.domain.Member;

public interface MemberRepository extends JpaRepository<Member, Long>{
	Member findBymbEmail(String mbEmail);
}
