package cs308dcm.repositories;

import org.springframework.data.repository.CrudRepository;

import cs308dcm.models.Staff;

public interface StaffRepository extends CrudRepository<Staff, Integer> {	
	
	public Staff findByUsernameAndPassword(String username, String password);
}
