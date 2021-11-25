   
package poly.cinema.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import poly.cinema.common.Utils;
import poly.cinema.dao.CouponDAO;
import poly.cinema.dto.CouponRequest;
import poly.cinema.entity.Coupon;
import poly.cinema.service.CouponService;

@Service
public class CouponServiceImpl implements CouponService{

	@Autowired
	CouponDAO couponDAO;
	
	@Autowired
	Utils utils;

	@Override
	public List<Coupon> findAll() {
		return couponDAO.findAll();
	}

	@Override
	public CouponRequest autoCreateCoupons() {
		List<Coupon> listCoupons = couponDAO.findAll();
		CouponRequest coupon = new CouponRequest();
		String code = "";
        for (int i = 0; i < 2; i++) {
            code = utils.getAlphaNumericString();
            if(utils.checkCouponsID(code, listCoupons) == true){
                i = 0;
            } else {
                coupon.setCode(code);
                i = 3;
            }
        }
		return coupon;
	}

	@Override
	public Coupon create(Coupon coupon) {
		return couponDAO.save(coupon);
	}

	@Override
	public Coupon update(Coupon coupon) {
		return couponDAO.save(coupon);
	}
	
}