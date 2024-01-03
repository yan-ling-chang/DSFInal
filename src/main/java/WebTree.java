

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

public class WebTree {
	public WebNode root;
	// map<url,nodescore>
	public HashMap<String, Double> map = new HashMap<String, Double>();

	public WebTree(WebPage rootPage) {
		this.root = new WebNode(rootPage);
	}

	public void setPostOrderScore(ArrayList<Keyword> keywords) throws IOException {
		setPostOrderScore(root, keywords);
	}

	private void setPostOrderScore(WebNode startNode, ArrayList<Keyword> keywords) throws IOException {
		if (startNode.children != null) {
			for (WebNode child : startNode.children) {
				child.setNodeScore(keywords);
			}
		}
		startNode.setNodeScore(keywords);
	}

	public void eularPrintTree() {
		eularPrintTree(root);
	}

	private void eularPrintTree(WebNode startNode) {
		map.put(startNode.webPage.url, startNode.nodeScore);
		if (startNode.children != null) {
			for (WebNode child : startNode.children) {
				eularPrintTree(child);
			}
		}
	}

	// method to sort values
	public HashMap sortValues(HashMap<String, Double> map) {
		List<Object> list = new LinkedList<Object>(map.entrySet());
		// Custom Comparator

		Collections.sort(list, new Comparator<Object>() {
			public int compare(Object o1, Object o2) {
				return ((Comparable) ((Map.Entry) (o2)).getValue()).compareTo(((Map.Entry) (o1)).getValue());
			}
		});
		// copying the sorted list in HashMap to preserve the iteration order
		HashMap sortedHashMap = new LinkedHashMap();
		for (Iterator it = list.iterator(); it.hasNext();) {
			Map.Entry entry = (Map.Entry) it.next();
			sortedHashMap.put(entry.getKey(), entry.getValue());
		}
		//for (Object key : sortedHashMap.keySet()) {
		//	if (map.get(key) > 0) {
		//		System.out.println("Website Title : " + getTitle(key.toString()) + " Value : " + map.get(key));
		//	}
		//}
		return sortedHashMap;
	}

	public String getTitle(String url) {
		String title = "";
		try {
			Document doc = Jsoup.connect(url).get();
			title = doc.title();
		} catch (Exception e) {
			// e.printStackTrace();
			return url;
		}
		return title;
	}

}
