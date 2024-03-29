package module.wxService.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;

import module.wxService.service.apisupport.AccessTokenService;
import module.wxService.service.apisupport.MenuService;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**
 * 自定义菜单加载器
 * 
 * @author 石莹 @ caituo
 *
 */
public class WxMenuLoader {
	private static final Log log = LogFactory.getLog(WxMenuLoader.class);

	private String jsonFilePath = null;
	
	public WxMenuLoader(String jsonFilePath) {
		this.jsonFilePath = jsonFilePath;
	}
	
	/**
	 * 提交微信菜单
	 * @param appid
	 * @param secret
	 */
	public void submitWxMenu(String appid, String secret) throws Exception {
		String accessToken = AccessTokenService.requestWxAccessToken(appid, secret);
		MenuService.submit(accessToken, loadMenuContent());
	}
	
	/**
	 * 加载菜单内容
	 * @return json
	 */
	public String loadMenuContent() {
		BufferedReader br = null;
		try {
			br = new BufferedReader(new InputStreamReader(
					WxMenuLoader.class.getClassLoader().getResourceAsStream(jsonFilePath), "UTF-8"));
			StringBuffer buf = new StringBuffer();
			String line = null;
			while ((line = br.readLine()) != null) {
				buf.append(line);
				buf.append("\n");
			}
			return buf.toString();
		} catch (Exception e) {
			log.warn("load menu content error.", e);
			return null;
		} finally {
			try {
				br.close();
			} catch (Exception e) {}
		}
	}
	
}
