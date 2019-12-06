package cn.ekgc.iTrip.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 * <b>认证模块控制器</b>
 * @version 3.0.0 2019-12-6
 * @since 3.0.0
 */
@RestController("authController")
@RequestMapping("/auth")
public class AuthController {
	@RequestMapping(value = "/api/ckusr", method = RequestMethod.GET)
	public String test(String name) throws Exception {
		System.out.println("name：" + name);
		return name;
	}
}
