package boarder.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import boarder.bean.BoardDto;

public class BoardDao {
	private static final int ArrayList = 0;
	private static final int BoardDto = 0;
	Connection conn=null; 
	Statement stmt=null;

	public BoardDao(){
	try{//�����ڷ� ����̹� ȣ��
		Class.forName("com.mysql.jdbc.Driver");
	}catch(Exception e){
		
	}
}
	
	public void close() {//DB�ݴ� �Լ�
		try{
			
			stmt.close();
			
		}catch(Exception e) {
			
		}try{
			
			conn.close();
			
		}catch(Exception e) {
			
		}
			
	}
	public  Date Date() {
	Date today=new Date(0);
	
	return today;
	}
	public ArrayList<BoardDto> List() {//�Խ��� ������� ���
		
		ArrayList<BoardDto> boarderlist=new ArrayList<BoardDto>(); 
		try{
		Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/pro?useSSL=false&useUnicode=true&characterEncoding=utf8","root","gkdud0477");
		stmt=conn.createStatement();//�ԽǱ� ��ü������� order by number desc �Խù���ȣ�� ������������ ����
		String command = "select * from board order by number desc;";
		ResultSet rs=stmt.executeQuery(command);
		while(rs.next()) {
			
			BoardDto dto=new BoardDto();
			dto.setNumber(rs.getInt("number"));
			dto.setCategory(rs.getString("category"));
			dto.setTitle(rs.getString("title"));
			dto.setWriter(rs.getString("writer"));
			dto.setDate(rs.getDate("date"));
			dto.setHits(rs.getInt("hits"));
			
			boarderlist.add(dto);
		}
		stmt.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		close();
		return boarderlist;
	}
	
	public ArrayList<BoardDto> List(String opt,String sel) {//�˻����ǰ� �˻������� �޾� ����Ʈ ���
		
		ArrayList<BoardDto> boarderlist=new ArrayList<BoardDto>();
		
		try{
		if(opt.equals("none")) {
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/pro?useSSL=false&useUnicode=true&characterEncoding=utf8","root","gkdud0477");
			stmt=conn.createStatement();//��ü �����Ϳ���(����,�۾���,����) DB�˻�
			String command = "select * from board where title like '%"+sel+"%' or writer like "+"'%"+sel+"%' or contents like "+"'%"+sel+"%' order by number desc;";
			//System.out.print(command);
			ResultSet rs=stmt.executeQuery(command);
			while(rs.next()) {
				
				BoardDto dto=new BoardDto();
				dto.setNumber(rs.getInt("number"));
				dto.setCategory(rs.getString("category"));
				dto.setTitle(rs.getString("title"));
				dto.setWriter(rs.getString("writer"));
				dto.setDate(rs.getDate("date"));
				dto.setHits(rs.getInt("hits"));
				
				boarderlist.add(dto);
			}
			}
		else if(opt.equals("title_contents")) {
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/pro?useSSL=false&useUnicode=true&characterEncoding=utf8","root","gkdud0477");
			stmt=conn.createStatement();//����+�������� DB�˻�
			String command = "select * from board where title like '%"+sel+"%' or contents like '%"+sel+"%' order by number desc;";
			//System.out.print(command);
			ResultSet rs=stmt.executeQuery(command);
			while(rs.next()) {
				
				BoardDto dto=new BoardDto();
				dto.setNumber(rs.getInt("number"));
				dto.setCategory(rs.getString("category"));
				dto.setTitle(rs.getString("title"));
				dto.setWriter(rs.getString("writer"));
				dto.setDate(rs.getDate("date"));
				dto.setHits(rs.getInt("hits"));
				
				boarderlist.add(dto);
			}
			}
		else{
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/pro?useSSL=false&useUnicode=true&characterEncoding=utf8","root","gkdud0477");
			stmt=conn.createStatement();//select�ɼǰ� �˻������ DB�˻� ���
			String command = "select * from board where "+opt+" like '%"+sel+"%' order by number desc;";
			//System.out.print(command);
			ResultSet rs=stmt.executeQuery(command);
			
			while(rs.next()) {
			
			BoardDto dto=new BoardDto();
			dto.setNumber(rs.getInt("number"));
			dto.setCategory(rs.getString("category"));
			dto.setTitle(rs.getString("title"));
			dto.setWriter(rs.getString("writer"));
			dto.setDate(rs.getDate("date"));
			dto.setHits(rs.getInt("hits"));
			
			boarderlist.add(dto);
		}
		}
		stmt.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		close();
		return boarderlist;
	}
	
	public int hits(String hits) {//�������� Ŭ���� ��ȸ�����޾� +1�� ���ؼ� ��ȯ
		int num=Integer.parseInt(hits)+1;
		return num;
	}
	
	public void hitsUpdate(String hits,String number) {//��ȸ�� ������Ʈ�ϱ����� ���� ��ȸ���� �Խñ۹�ȣ�� �޾ƿͼ� �Խñ۹�ȣ���ǿ��ش��ϴ� hits�� ������Ʈ�Ѵ�
		int num=hits(hits);//��ȸ���� ������Ʈ �ϱ����� hits�� �Ű������� �޾ƿ��ش�
		int NO=Integer.parseInt(number);
		try {
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/pro?useSSL=false&useUnicode=true&characterEncoding=utf8","root","gkdud0477");
			stmt = conn.createStatement();
			String command = "update board set hits="+num+" where number="+NO+";";
			//System.out.print(command);
			int rowNum = stmt.executeUpdate(command);
			if(rowNum<1)
			throw new Exception("�����͸� DB�� �Է��� �� �����ϴ�."); 
			
			stmt.close();
	} catch (Exception e) {
		System.out.println(e);
	}
		
	close();
	}
	
	
	
	public  ArrayList<BoardDto> BoardContentsView(String number) {//�������� ��������ȣ�� �޾Ƽ� ����Ʈ�� ���
		ArrayList<BoardDto> boarderView = new ArrayList<BoardDto>();
		int num;
		num=Integer.parseInt(number);
		try {
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/pro?useSSL=false&useUnicode=true&characterEncoding=utf8","root","gkdud0477");
			stmt = conn.createStatement();
			String command = "select * from board where number="+num+";";
			ResultSet rs = stmt.executeQuery(command);	
			
			while(rs.next()){
				BoardDto dto = new BoardDto();
				dto.setNumber(rs.getInt("number"));
				dto.setCategory(rs.getString("category"));
				dto.setTitle(rs.getString("title"));
				dto.setWriter(rs.getString("writer"));
				dto.setDate(rs.getDate("date"));
				dto.setHits(rs.getInt("hits"));
				dto.setContents(rs.getString("contents"));
				
				boarderView.add(dto);
			}

			
			stmt.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		close();
return boarderView;
	}
	
		
	public void BoardWrite(String category,String title,String writer,String contents){//DB�� �Խñ� �Է�
			String date="now()";//�ۼ����� DB���� ����ð����� ó���ϱ����� now()��ɾ ��Ʈ�������� �־��ش�
			ArrayList<BoardDto> list=List();
			int num=list.size()+1;
		    int hits=0;
		try {
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/pro?useSSL=false&useUnicode=true&characterEncoding=utf8","root","gkdud0477");
			stmt = conn.createStatement();
			String command = "insert into board values("+num+",'"+category+"','"+title+"','"+writer+"',"+date+","+hits+",'"+contents+"');";
			//System.out.print(command);
			int rowNum = stmt.executeUpdate(command);
			if(rowNum<1)
			throw new Exception("�����͸� DB�� �Է��� �� �����ϴ�."); 
			
			stmt.close();
	} catch (Exception e) {
		System.out.println(e);
	}
		
	close();
}
	
	public void Boardupdate(String number,String category,String title,String contents) {//�Խñ� ������ DB ������Ʈ
		int num=Integer.parseInt(number);
		try {
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/pro?useSSL=false&useUnicode=true&characterEncoding=utf8","root","gkdud0477");
			stmt = conn.createStatement();
			String command = "update board set category='"+category+"',"+"title='"+title+"',"+"contents='"+contents+"'"+"where number="+num+";";
			//System.out.print(command);
			int rowNum = stmt.executeUpdate(command);
			if(rowNum<1)
			throw new Exception("�����͸� DB�� �Է��� �� �����ϴ�."); 
			
			stmt.close();
	} catch (Exception e) {
		System.out.println(e);
	}
		
	close();
	}
	

	
	public void BoardDelete(String number) {//�Խñ� ����
		int num=Integer.parseInt(number);
		try {
			Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/pro?useSSL=false&useUnicode=true&characterEncoding=utf8","root","gkdud0477");
			stmt = conn.createStatement();
			String command = "delete from board where number="+num+";";
			
			int rowNum = stmt.executeUpdate(command);
			if(rowNum<1)
			throw new Exception("�����͸� DB�� �Է��� �� �����ϴ�."); 
			
			stmt.close();
	} catch (Exception e) {
		System.out.println(e);
	}
		
	close();
	}

}




