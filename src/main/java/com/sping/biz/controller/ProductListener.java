package com.sping.biz.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.Random;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

import com.sping.biz.common.JDBCUtil;

@WebListener
public class ProductListener implements ServletContextListener {

	public ProductListener() {
		// TODO Auto-generated constructor stub
	}

	public void contextDestroyed(ServletContextEvent sce) {
		// TODO Auto-generated method stub
	}

	public void contextInitialized(ServletContextEvent sce) {
		int[] category = { 300, 401, 402, 403, 404, 405, 501, 600, 700, 801, 802, 803 };
		Random rd = new Random();
		Connection conn = JDBCUtil.connect();
		PreparedStatement pstmt = null;

		for (int a = 1; a < 7; a++) {
			// 타겟 사이트
			String url = "https://www.boardgamemall.co.kr/goods/goods_list.php?page=" + a + "&cateCd=047"; // 페이지 넘어가는 url
			String url2 = "https://www.boardgamemall.co.kr"; // 상세페이지로 넘어가기 위한 url

			Document doc = null;
			Document doc2 = null;

			try {
				doc = Jsoup.connect(url).get();
				Elements imgUrl = doc.select(".goods_list").get(1).select(".item_tit_box");

				for (int i = 0; i < 43; i++) {
					doc2 = Jsoup.connect(url2 + imgUrl.get(i).select("a").attr("href").substring(2)).get();

					Elements all = doc2.select(".content_box");
					Elements el = doc2.select(".item_tit_detail_cont");
					Elements info = el.select(".item_detail_list").select("dl");
					Elements img = doc2.select(".content_box").select(".img_photo_big");

					if (info.size() != 9) {
						continue;
					}

					String pName = el.select(".item_detail_tit").select("h3").text();
					int fixPrice = Integer.parseInt(info.get(0).select("span").text().replace(",", ""));
					int selPrice = Integer.parseInt(info.get(1).select("b").text().replace(",", ""));
					String rePerson = info.get(4).select("dd").text();
					int reAge = Integer.parseInt(info.get(5).select("dd").text().replace("이상", "").replace("세", "").replace("만", "").trim());
					String brand = info.get(6).select("dd").text();
					String pImg = img.select("a").select("img").attr("src");
					String infoImg = all.select(".txt-manual").select("img").get(1).attr("src");
					int cateNum = 0;
					if (rePerson.equals("1명")) {
						cateNum = 200;
					} else {
						cateNum = category[rd.nextInt(12)];
					}
					Calendar cal1 = Calendar.getInstance();
					cal1.add(Calendar.DATE, -(rd.nextInt(365)));
					Date rDate = new Date(cal1.getTimeInMillis());

					pstmt = conn.prepareStatement("INSERT INTO PRODUCT VALUES(PNUM_SEQ.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 50)");

					pstmt.setInt(1, cateNum);
					pstmt.setString(2, pName);
					pstmt.setInt(3, fixPrice);
					pstmt.setInt(4, selPrice);
					pstmt.setDate(5, rDate);
					pstmt.setString(6, rePerson);
					pstmt.setInt(7, reAge);
					pstmt.setString(8, brand);
					pstmt.setString(9, pImg);
					pstmt.setString(10, infoImg);

					pstmt.executeUpdate();
				}
			} catch (

			IOException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		System.out.println("   로그: 크롤링 완료");
	}

}
