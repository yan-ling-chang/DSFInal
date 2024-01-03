import java.io.IOException;
import java.util.HashSet;
import java.util.Set;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

public class Read_Sub_Links {
	public static Set<String> uniqueURL = new HashSet<String>();
	public static String my_site;

	public Read_Sub_Links(String url) {
		my_site = url;
		get_links(url);
	}

//New Operator for lambda expression added in java 8
//Lambda expression is the short way of method writing.
//Primary Syntax : (parameters) -> { statements;}
//Example:Runnable r = ()-> System.out.print("Run method");
//Runnable r = new Runnable() {
//@Override
// public void run() {
// System.out.print("Run method");
// }
//};
	private void get_links(String url) {
		try {
			Document doc = Jsoup.connect(url).get();
			Elements links = doc.select("a");
			links.stream().map((link) -> link.attr("abs:href")).forEachOrdered((this_url) -> {
				boolean add = uniqueURL.add(this_url);
				if (add && this_url.contains(my_site)) {
					System.out.println(this_url);
					get_links(this_url);
				}
			});

		} catch (IOException ex) {

		}

	}
}
