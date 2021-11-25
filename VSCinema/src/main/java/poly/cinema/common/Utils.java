package poly.cinema.common;

import java.util.List;

import org.springframework.stereotype.Component;

import poly.cinema.entity.Coupon;

@Component
public class Utils {

	public boolean checkCouponsID(String code, List<Coupon> list) {
        boolean result = false;
        if (!list.isEmpty()) {
            for (Coupon coupon : list) {
                if (coupon.getId().equals(code)) {
                	result = true;
                }
            }
        } else {
        	result = false;
        }
        return result;
    }
	
	public String getAlphaNumericString(){
        String AlphaNumericString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
                                    + "0123456789"
                                    + "abcdefghijklmnopqrstuvxyz";
        StringBuilder sb = new StringBuilder(); 
        for (int i = 0; i < 11; i++) {
            int index = (int)(AlphaNumericString.length()* Math.random());
            sb.append(AlphaNumericString.charAt(index));
        }
        return sb.toString();
    }
	
}