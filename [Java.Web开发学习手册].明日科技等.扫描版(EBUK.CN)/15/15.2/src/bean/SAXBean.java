package bean;
import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;
public class SAXBean extends DefaultHandler {
	Logger onelogger = Logger.getLogger("onelogger");
	Logger newlogger = Logger.getLogger("onelogger.newLogger");

	private String[][] element = new String[2][4];
	private int index = -1;
	private String currentElement;
	public String[][] getElements() {
		return element;
	}
	public SAXBean() {
		PropertyConfigurator.configure(SAXBean.class
				.getResource("log4j.properties"));
	}
	public void characters(char[] ch, int start, int length)
			throws SAXException {
		String content = new String(ch, start, length).trim();
		if (content.equals(""))
			return;
		if (index < 0)
			return;
		int index2 = -1;
		if (currentElement.equals("id"))
			index2 = 0;
		if (currentElement.equals("name"))
			index2 = 1;
		if (currentElement.equals("publish"))
			index2 = 2;
		if (currentElement.equals("price"))
			index2 = 3;
		if (index2 != -1) {
			element[index][index2] = content;
		}
	}
	public void endDocument() throws SAXException {
		onelogger.info("文档结束");
	}
	public void endElement(String uri, String localName, String qName)
			throws SAXException {
		onelogger.info("元素结束");
	}
	public void startDocument() throws SAXException {
		onelogger.info("文档开始");
	}
	public void startElement(String uri, String localName, String qName,
			Attributes attributes) throws SAXException {
		currentElement = qName;
		if (qName.equals("book")) {
			index++;
		}
		onelogger.info("元素开始" + qName);
	}
}