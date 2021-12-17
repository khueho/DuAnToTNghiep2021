package poly.cinema.service.impl;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;
import java.util.TimeZone;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import poly.cinema.dao.SaleDAO;
import poly.cinema.entity.Sale;
import poly.cinema.service.SaleService;

@Service
public class SaleServiceImpl implements SaleService{

	@Autowired
	SaleDAO dao;
	

	@Override
	public List<Sale> findAll() {
		return dao.findAll();
	}
	
	@Override
	public void deleteById(Integer id) {
		dao.deleteById(id);
	}
	
	@Override
	public Sale create(Sale sale) {
		return dao.save(sale);
	}
	
	@Override
	public Sale update(Sale sale) {
		return dao.save(sale);
	}
	

	@Override
	public Sale findById(Integer id) {

		return dao.findById(id).get();
	}
	
	@Override
	public List<Sale> findByFoodId(Integer id) {
		// TODO Auto-generated method stub
		return dao.findByFoodID(id);
	}

	@Override
	public List<Sale> getSale() {
		Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
		List<Sale> sales = dao.findAll();
		List<Sale> listSale = new ArrayList<Sale>();
		for(Sale s:sales) {
			if(s.getEndDate().getTime() >= cld.getTime().getTime()) {
				listSale.add(s);
			}
		}
		return listSale;
	}
}