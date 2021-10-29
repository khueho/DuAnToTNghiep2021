package poly.cinema.rest.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import poly.cinema.entity.PriceShow;
import poly.cinema.service.PriceShowService;

@RestController
public class PriceShowRestController {
	@Autowired PriceShowService priceshowservice;
	@GetMapping("/rest/price_show")
	public List<PriceShow> getAll(){
		return priceshowservice.getAll();
	}
}
