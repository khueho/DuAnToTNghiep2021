package poly.cinema.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import poly.cinema.dao.Price_ShowDAO;
import poly.cinema.entity.PriceShow;
import poly.cinema.service.PriceShowService;

@Service
public class PriceShowServiceImpl implements PriceShowService{
@Autowired Price_ShowDAO priceshowdao;
	@Override
	public List<PriceShow> getAll() {
		// TODO Auto-generated method stub
		return priceshowdao.findAll();
	}

}
