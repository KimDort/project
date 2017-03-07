package com.project.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.project.service.AddressService;
import com.project.vo.AddressVO;

@RestController
@RequestMapping("/address/**")
public class AddressController {
	@Inject
	private AddressService service;
	
	@RequestMapping(value="/searchlist/{eupmyeon}",method=RequestMethod.GET)
	public ResponseEntity<List<AddressVO>> getListSearch(@PathVariable("eupmyeon")String LegalEupMyeon){
		ResponseEntity<List<AddressVO>> entity=null;		
		List<AddressVO> searchList=new ArrayList<>();
		AddressVO vo=new AddressVO();
		try {			
			String[] search=LegalEupMyeon.split(" ");

			if(search.length==2){
				vo.setCitied(search[0].toString());
				vo.setStreet(search[1].toString());
			}else if(search.length==1){				
				vo.setCitied(search[0].toString());
				
				if(service.SearchAddress(vo)==null || service.SearchAddress(vo).isEmpty() || service.SearchAddress(vo).equals(null)){
					vo.setCitied("");
					vo.setStreet(search[0].toString());
					searchList=service.SearchAddress(vo);
				}else{
					searchList=service.SearchAddress(vo);
				}
			}
			entity=new ResponseEntity<>(service.SearchAddress(vo),HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			entity=new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
