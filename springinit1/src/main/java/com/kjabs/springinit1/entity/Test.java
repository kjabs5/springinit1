package com.kjabs.springinit1.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="test")
public class Test {
	
	@Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name="id")
	private int id;
    
    @Column(name="name")
	private String name;
    
    @Column(name="file_name")
	private String file_name;
    
    @Column(name="file_path")
	private String file_path;
    
    @Column(name="file_size")
   	private String file_size;
       
    @Column(name="file_type")
   	private String file_type;


	
	public Test()
	{
		
	}
	

	



	public Test(int id, String name, String file_name, String file_path, String file_size, String file_type) {
		super();
		this.id = id;
		this.name = name;
		this.file_name = file_name;
		this.file_path = file_path;
		this.file_size = file_size;
		this.file_type = file_type;
	}






	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getFile_name() {
		return file_name;
	}

	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}

	public String getFile_path() {
		return file_path;
	}

	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}

	public String getFile_size() {
		return file_size;
	}

	public void setFile_size(String file_size) {
		this.file_size = file_size;
	}

	public String getFile_type() {
		return file_type;
	}

	public void setFile_type(String file_type) {
		this.file_type = file_type;
	}


	
	
    
}
