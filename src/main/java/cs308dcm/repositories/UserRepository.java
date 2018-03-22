package cs308dcm.repositories;

import org.springframework.data.repository.CrudRepository;

import cs308dcm.models.User;

public interface UserRepository extends CrudRepository<User, Integer> {	
	
	public User findByUsernameAndPassword(String username, String password);
}
