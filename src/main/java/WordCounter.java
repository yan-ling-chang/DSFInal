
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.HashMap;

public class WordCounter {
	private String urlStr;
	private String content;
	// detect different language
	private HashMap<String, String> lan_chi = new HashMap<>();
	private HashMap<String, String> lan_en = new HashMap<>();

	public WordCounter(String urlStr) {
//		lan_chi.put("BLUETOOTH", "藍芽");
//		lan_chi.put("WIRELESS", "無線");
//		lan_chi.put("WIRED", "有線");
//		lan_chi.put("OPTICAL", "光學");
//		lan_chi.put("RECHARGEABLE", "充電");
//		lan_chi.put("POWERPLAY", "強力播放");
//		lan_chi.put("ALKALINE", "鹼性電池");
//		lan_chi.put("LIGHTSYNC", "光同步");
//		lan_chi.put("LASER", "雷射");
//		lan_en.put("藍芽", "BLUETOOTH");
//		lan_en.put("無線", "WIRELESS");
//		lan_en.put("有線", "WIRED");
//		lan_en.put("光學", "OPTICAL");
//		lan_en.put("充電", "RECHARGEABLE");
//		lan_en.put("強力播放", "POWERPLAY");
//		lan_en.put("鹼性電池", "ALKALINE");
//		lan_en.put("光同步", "LIGHTSYNC");
//		lan_en.put("雷射", "LASER");
		this.urlStr = urlStr;
	}

	private String fetchContent() throws IOException {
		URL url = new URL(this.urlStr);
		URLConnection conn = url.openConnection();
		InputStream in = conn.getInputStream();
		BufferedReader br = new BufferedReader(new InputStreamReader(in));
		String retVal = "";
		String line = null;
		while ((line = br.readLine()) != null) {
			retVal = retVal + line + "\n";
		}
		return retVal;
	}

	public int countKeyword(String keyword) throws IOException {
		int retVal = 0;
		try {
			if (content == null) {
				content = fetchContent();
			}
			content = content.toUpperCase();
			keyword = keyword.toUpperCase();
			String trans_keyword = (lan_chi.containsKey(keyword)) ? lan_chi.get(keyword) : lan_en.get(keyword);
			int fromIdx = 0;
			int found = -1;
			while ((found = content.indexOf(keyword, fromIdx)) != -1) {
				retVal++;
				fromIdx = found + keyword.length();
			}
			fromIdx = 0;
			found = -1;
			while ((found = content.indexOf(trans_keyword, fromIdx)) != -1) {
				retVal++;
				fromIdx = found + keyword.length();
			}
		} catch (Exception e) {
		}
		return retVal;
	}
}
