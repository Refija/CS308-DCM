package cs308dcm.services;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import cs308dcm.models.Staff;
import cs308dcm.repositories.StaffRepository;

@Service
@Transactional
public class StaffService {
	
	private final StaffRepository staffRepository;
	
	public StaffService(StaffRepository staffRepository) {
		this.staffRepository=staffRepository;
	}
	
	public void saveMyUser(Staff staff ) {
		staffRepository.save(staff);
	}
	
	public List<Staff> showAllUsers(){
		List<Staff> users = new ArrayList<Staff>();
		for(Staff staff : staffRepository.findAll()) {
			users.add(staff);
		}
		
		return users;
	}
	
	public void deleteMyStaff(int id) {
		staffRepository.deleteById(id);
	}
	
	public Optional<Staff> editStaff(int id) {
		return staffRepository.findById(id);
	}
	
	public Staff findByUsernameAndPassword(String username, String password) {
		return staffRepository.findByUsernameAndPassword(username, password);
	}
	
}
