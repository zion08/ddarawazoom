package org.mvc.bean;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;

@Data
public class YoutubeDTO {
	String title;
	String channelTitle;
	ArrayList<String> tags;
	String embedHtml;
	String vNum;
	String regDate;
}
