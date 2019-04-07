package free.applygetlist.vo;

public class ApplyGetListVo {
	
	private String freeln_id;
	private String freeln_nm;
	private String project_id;
	private String project_nm;
	private String apply_date;
	private String apply_yn;
	private int rownum;
	
	
	public int getRownum() {
		return rownum;
	}
	public void setRownum(int rownum) {
		this.rownum = rownum;
	}
	public String getFreeln_nm() {
		return freeln_nm;
	}
	public void setFreeln_nm(String freeln_nm) {
		this.freeln_nm = freeln_nm;
	}
	public String getProject_nm() {
		return project_nm;
	}
	public void setProject_nm(String project_nm) {
		this.project_nm = project_nm;
	}
	public String getFreeln_id() {
		return freeln_id;
	}
	public void setFreeln_id(String freeln_id) {
		this.freeln_id = freeln_id;
	}
	public String getProject_id() {
		return project_id;
	}
	public void setProject_id(String project_id) {
		this.project_id = project_id;
	}
	public String getApply_date() {
		return apply_date;
	}
	public void setApply_date(String apply_date) {
		this.apply_date = apply_date;
	}
	public String getApply_yn() {
		return apply_yn;
	}
	public void setApply_yn(String apply_yn) {
		this.apply_yn = apply_yn;
	}

}
