package poly.cinema.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import poly.cinema.dao.AccountDAO;
import poly.cinema.dao.TokenDAO;
import poly.cinema.dto.TokenRequest;
import poly.cinema.entity.Account;
import poly.cinema.entity.Token;
import poly.cinema.service.MailerService;
import poly.cinema.service.TokenService;

@Service
public class TokenServiceImpl implements TokenService{

	@Autowired
	TokenDAO tokenDAO;
	
	@Autowired
	HttpServletRequest request;

	@Autowired
	MailerService mailerService;
	
	@Autowired
	HttpSession session;
	
	@Override
	public Token change(TokenRequest tokenRequest) {
		String AlphaNumericString = "0123456789";
		StringBuilder sb = new StringBuilder(6);
		for (int i = 0; i < 6; i++) {
            int index = (int)(AlphaNumericString.length() * Math.random());		  
            sb.append(AlphaNumericString.charAt(index));
        }
		String code = sb.toString();
		
		Token token = new Token(tokenRequest.getPassword(), code, tokenRequest.getExpiry(), tokenRequest.getExpiry(), tokenRequest.getCategory(), tokenRequest.getActivity(), tokenRequest.getUser());
		
		List<Token> list = tokenDAO.findByUsername(tokenRequest.getUser().getUsername());
		list.forEach(t -> {
			if(t.getActivity() == true && t.getCategory() == 0) {
				t.setActivity(false);
				tokenDAO.save(t);
			}
		});
		try {
			mailerService.send(tokenRequest.getUser().getEmail(), "Mã xác nhận", "Mã xác nhận của bạn là: " + code);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		return tokenDAO.save(token);
	}

	@Override
	public Token findByUsername() {
		String username = request.getRemoteUser();
		List<Token> list =  tokenDAO.findByUsername(username);
		Token token = new Token();
		Date now = new Date();
		SimpleDateFormat formatDate = new SimpleDateFormat("dd/MM/yyyy"); 
		SimpleDateFormat formatTime = new SimpleDateFormat("HH:mm:ss");
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss"); 
		list.forEach(t -> {
			try {
				String expiryDate = formatDate.format(t.getExpirydate());
				String expiry = formatTime.format(t.getExpiry());
				String textDate = expiryDate+" "+expiry;
				Date date = formatter.parse(textDate);
				if((date.getTime()+900000) > now.getTime() && t.getActivity() && t.getCategory() == 0) {
					token.setId(t.getId());
					token.setPassword(t.getPassword());
					token.setCode(t.getCode());
					token.setExpirydate(date);
					token.setExpiry(date);
					token.setCategory(t.getCategory());
					token.setActivity(t.getActivity());
					token.setUser(t.getUser());
				}
			} catch (ParseException e) {
				e.printStackTrace();
			}
		});
		return token;
	}

	@Override
	public Token forgot(TokenRequest tokenRequest) {
		String AlphaNumericStringCode = "0123456789";
		String AlphaNumericStringPass = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
                + "0123456789"
                + "abcdefghijklmnopqrstuvxyz";
		StringBuilder cd = new StringBuilder(6);
		StringBuilder pw = new StringBuilder(6);
		for (int i = 0; i < 6; i++) {
            int indexCode = (int)(AlphaNumericStringCode.length() * Math.random());		  
            cd.append(AlphaNumericStringCode.charAt(indexCode));
            
            int indexPass = (int)(AlphaNumericStringPass.length() * Math.random());		  
            pw.append(AlphaNumericStringPass.charAt(indexPass));
        }
		String code = cd.toString();
		String pass = pw.toString();
		Token token = new Token(pass, code, tokenRequest.getExpiry(), tokenRequest.getExpiry(), tokenRequest.getCategory(), tokenRequest.getActivity(), tokenRequest.getUser());
		session.setAttribute("username", tokenRequest.getUser().getUsername());
		List<Token> list = tokenDAO.findByUsername(tokenRequest.getUser().getUsername());
		list.forEach(t -> {
			if(t.getActivity() == true && t.getCategory() == 1) {
				t.setActivity(false);
				tokenDAO.save(t);
			}
		});
		try {
			mailerService.send(tokenRequest.getUser().getEmail(), "Mã xác nhận", "Mã xác nhận của bạn là: " + code);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		return tokenDAO.save(token);
	}

	@Override
	public Token getTokenForgot() {
		String username = (String) session.getAttribute("username");
		List<Token> list =  tokenDAO.findByUsername(username);
		Token token = new Token();
		Date now = new Date();
		SimpleDateFormat formatDate = new SimpleDateFormat("dd/MM/yyyy"); 
		SimpleDateFormat formatTime = new SimpleDateFormat("HH:mm:ss");
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss"); 
		list.forEach(t -> {
			try {
				String expiryDate = formatDate.format(t.getExpirydate());
				String expiry = formatTime.format(t.getExpiry());
				String textDate = expiryDate+" "+expiry;
				Date date = formatter.parse(textDate);
				if((date.getTime()+900000) > now.getTime() && t.getActivity() && t.getCategory() == 1) {
					token.setId(t.getId());
					token.setPassword(t.getPassword());
					token.setCode(t.getCode());
					token.setExpirydate(date);
					token.setExpiry(date);
					token.setCategory(t.getCategory());
					token.setActivity(t.getActivity());
					token.setUser(t.getUser());
				}
			} catch (ParseException e) {
				e.printStackTrace();
			}
		});
		return token;
	}
	
}
