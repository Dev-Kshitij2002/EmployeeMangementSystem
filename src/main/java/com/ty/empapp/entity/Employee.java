package com.ty.empapp.entity;

import java.time.LocalDateTime;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.validation.constraints.Digits;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Data;

@Entity
@Table(name = "emp_info")
@Data
public class Employee {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer eid;
	
	@Size(min = 3, max = 10, message = "Name must be min 3 and max 10 characters")
	@NotEmpty(message = "Name cannot be empty")
	private String name;
	 
	@Email(message = "Invalid Email")
	@NotEmpty
	@Column(unique = true)
	private String email;
	
	@NotNull
	@Digits(integer = 10, fraction = 0, message = "Phone number must be 10 digits")
	private Long phone;
	
	@NotEmpty
	private String password;
	
	@CreationTimestamp
	@Column(updatable = false)
	private LocalDateTime createdDate;
	
	@UpdateTimestamp
	private LocalDateTime updatedDate;
}
