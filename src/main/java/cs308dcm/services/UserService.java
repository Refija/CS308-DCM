package cs308dcm.services;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import cs308dcm.models.User;
import cs308dcm.repositories.UserRepository;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

public class UserService {
JdbcTemplate template;

public void setTemplate(JdbcTemplate template) {
	this.template = template;
}
public int save(User p){
	String sql="insert into User(firstName,lastName,email,dateOfBirth,address,username,password) values('"+p.getFirstName()+"',"+p.getLastName()+",'"+p.getEmail()+"',"+ p.getDateOfBirth()+"',"+p.getAddress()+"',"+p.getUsername()+"',"+ p.getPassword()+"')";
	return template.update(sql);
}
public int update(User p){
	String sql="update User set name='"+p.getFirstName()+"set last name='"+p.getLastName()+"set email='"+p.getEmail()+"set date of birth='"+ p.getDateOfBirth()+"set address='"+p.getAddress()+"set username='"+p.getUsername()+"set password='"+ p.getPassword()+"'";
	return template.update(sql);
}
public int delete(int id){
	String sql="delete from User where id="+id+"";
	return template.update(sql);
}
public User getUserById(int id){
	String sql="select * from User where id=?";
	return template.queryForObject(sql, new Object[]{id},new BeanPropertyRowMapper<User>(User.class));
}
public List<User> getUsers(){
	return template.query("select * from User",new RowMapper<User>(){
		public User mapRow(ResultSet rs, int row) throws SQLException {
			User e=new User();
			e.setId(rs.getInt(1));
			e.setFirstName(rs.getString(2));
			e.setLastName(rs.getString(3));
			e.setEmail(rs.getString(4));
			e.setDateOfBirth(rs.getDate(5));
			e.setAddress(rs.getString(6));
			e.setUsername(rs.getString(7));
			e.setPassword(rs.getString(8));
			return e;
		}
	});
}
}