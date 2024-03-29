package module.wxService.vo.recv;


public class WxRecvPicMsg extends WxRecvMsg {
	private String picUrl;
	private String mediaId;

	public WxRecvPicMsg(WxRecvMsg msg,String picUrl, String mediaId) {
		super(msg);
		this.picUrl = picUrl;
		this.mediaId = mediaId;
	}
	
	public String getPicUrl() {
		return picUrl;
	}

	public void setPicUrl(String picUrl) {
		this.picUrl = picUrl;
	}

	public String getMediaId() {
		return mediaId;
	}

	public void setMediaId(String mediaId) {
		this.mediaId = mediaId;
	}
	
	
}
