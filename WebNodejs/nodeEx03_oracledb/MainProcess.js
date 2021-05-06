/**
 * http://127.0.0.1:15005/home
 */
var http = require('http');
var fs = require('fs');
var mime = require('Mime');

var express = require('express');
var requestip = require('request-ip');

var ejs = require('ejs');
//============================== JDBC ================================
var oracledb = require('oracledb');
//자동 커밋 세팅
var conn; //DB연결정보를 보관할 전역변수
oracledb.autoCommit=true;
//db연결정보 설정
oracledb.getConnection({
	user : 'c##scott',
	password : 'tiger',
	connectString : 'localhost:1521/xe'},
	function(error, con){//연결이 완료되거나 에러가 발생하면 호출되는 콜백함수
		if(error){ //연결실패시
			console.log("db연결 실패");
		}else{//연결성공시
			conn = con;
			console.log("db연결 성공!");
		}
});
//express 객체 생성
var app = express();
var server = http.createServer(app);

//===================post방식 전송시 데이터 parser설정=====================
var bodyParser = require('body-parser');
app.use(express.static(__dirname)); //express에 기본 디렉토리 설정
app.use(bodyParser.urlencoded({extended:true})); //한글 인코딩 세팅
//====================================================================

//서버에 접속시 get방식으로 접속하면 get(), post방식으로 접속시 post()함수를 사용한다.
app.get('/home', function(request, response){
	fs.readFile(__dirname+"\\home.ejs", 'utf-8', function(error, data){
		if(error){
			response.writeHead(200, {"Content-type":"text/html; charset=utf-8"});
			response.end('파일읽기 에러발생');
		}else{
			//로그인 여부 확인
			var val = session.user; // 아이디, 이름, logStatus
			console.log(val+"!!!!!!!!!!!!!!!!!!!!")
			if(val){//로그인이 된 경우
				response.writeHead(200, {"content-type":"text/html; charset=utf-8"});
				response.end(ejs.render(data,{user:val, logStatus:'Y'}));
			}else{//로그인 안된 경우
				response.writeHead(200, {"content-type":"text/html; charset=utf-8"});
				response.end(ejs.render(data,{logStatus:'N'}));
			}
			//response.writeHead(200, {"Content-type":"text/html; charset=utf-8"});
			//response.end(data);
		}
	});
});
//이미지 처리
app.get('/images/*', function(req, res){
	var path = req.url; //    /images/Lighthouse.jpg
	var imgMime = mime.getType(path.substring(1));
	
	fs.readFile(".."+path, function(error, data){
		if(!error){
			res.writeHead(200, {"Contetnt-type":imgMime});
			res.end(data);
		}
	});
});
//게시판 목록
app.get('/list', function(req, res){
	//데이터 베이스 조회
	var sql = "select no, subject, userid, hit, to_char(writedate, 'MM-DD HH:MI') writedate from board order by no desc";
	
	//쿼리문 실행
	conn.execute(sql, function(error, result){
		if(error){
			//레코드 선택에러....
			res.writeHead(200, {'Content-type':'text/html; charset=utf-8'});
			res.end('<script>location.href="/home";</script>');
		}else{
			//레코드 선택시...
			//console.log(result);
			
			fs.readFile('boardList.ejs', 'utf-8', function(error, data){
				if(error){
					res.writeHead(200, {'Content-type':'text/html; charset=utf-8'});
					res.end('<script>loactoin.href="/home";</script>');
				}else{
					// 총 레코드 수 구하기
					var totalRecord = result.rows.length;
					//
					var val = session.user;
					var log = "";
					if(val){
						log = 'Y';
					}else{
						log = "N";
					}
					//
					res.writeHead(200, {'Content-Type':'text/html; charset=utf-8'});
					
					//ejs 페이지에서 사용할 데이터는 ejs페이지에 render하여 보낸다.
					//					(ejs소스코드, {보낼 데이터는 json으로})
					res.end(ejs.render(data, {
						logStatus : log,
						results : result,
						totalrecord : totalRecord,
						parsing : {
							firstPage : 6,
							lastPage : 10,
							totalPage : 9,
							currentPage : 7
						}
					}));
				}
			});
		}
	});
	
	
//	fs.readFile(__dirname+"\\boardList.ejs", function(error, data){
//		if(!error){
//			res.writeHead(200, {"Content-type":"text/html; charset=utf-8"});
//			res.end(data);
//		}
//	});
});
//글쓰기 폼
app.get('/boardWrite', function(req, res){
	fs.readFile(__dirname+"\\boardWrite.html",'utf-8', function(e, d){
		if(!e){
			
			res.writeHead(200, {"Content-type":"text/html; charset=utf-8"});
			res.end(ejs.render(d, {user: session.user}));
		}
	});
});
//글쓰기 완료
app.post('/writeOk', function(req, res){
	//클라이언트 폼의 데이터를 서버로 request
	var userid = req.param('userid');
	var subject = req.param('subject');
	var content = req.param('content');
	
	//접속자의 ip를 구한다.
	var ip = requestip.getClientIp(req).substring(7); //   ::ffff:127.0.0.1로 구해진다.
	console.log('writeOk data ====> userid=%s, subject=%s, content=%s, ip', userid, subject, content, ip);

	var sql = 'insert into board(no, userid, subject, content, ip, hit, writedate) ' +
				"values(boardsq.nextval, '"+userid+"', '"+subject+"', '"+content+"', '"+ip+"', 0, sysdate)";
	console.log('writeOk sql => ', sql);
	//데이터 베이스에 글등록
	//			(실행할 쿼리문, 콜백함수)
	conn.execute(sql, function(error, result){
		if(error){//등록 실패
			res.writeHead(200, {"Content-type":"text/html;charset=utf-8"});
			res.write("<script>");
			res.write("alert('글등록실패....');");
			res.write("history.back();");
			res.end("</script>");
		}else{//등록 성공
			res.writeHead(200, {'Content-type':'text/html;charset=utf-8'});
			res.write('<script>alert("글이 등록되었음"); location.href="/list";');
			res.end("</script>");
		}
	});
});
//글 내용 보기
app.get('/boardView', function(req, res){
	//1. 글번호 request
	var no = req.param('no');
	//2. 조회수 증가
	var sql = "update board set hit = hit+1 where no="+no;
	conn.execute(sql, function(error, result){
		if(error){
			console.log("조회수 증가 에러..");
		}else{
			console.log("조회수 증가 성공~");
		}
	});
	//3. 레코드 선택하여 ejs로 보내기
	//CLOB 데이터형 처럼 대용량 데이터인 경우 DBMS_LOB.SUBSTR()함수를 이용하여 레코드를 선택하여야 한다.
	var sql2 = "select no, userid, subject, DBMS_LOB.SUBSTR(content, DBMS_LOB.GETLENGTH(content)) content, " +
			" hit, to_char(writedate, 'YYYY-MM-DD HH:MI:SS') writedate from board where no="+no;
	//---
	conn.execute(sql2, function(error, result){
		if(error){
			console.log("글내용보기 레코드 선택 에러");
		}else{
			fs.readFile("boardView.ejs", 'utf-8', function(error, data){
				if(error){
					console.log("boardView.ejs파일읽기 실패");
				}else{
					console.log('=========boardView============');
					console.log(result);
					
					res.writeHead(200, {"Content-type":"text/html;charset=utf-8"});
					if(session.user){
						res.end(ejs.render(data,{
							records:result,
							user : session.user,
							logStatus : 'Y'
							}));
					}else{
						res.end(ejs.render(data,{
							records:result,
							logStatus : 'N'
						}));
					}
				}
			});
		}
	});
});
//글 내용수정 폼
app.get('/boardEdit', (request, res)=>{
	var no =request.param('no');
	
	var sql = "select no, userid, subject, DBMS_LOB.SUBSTR(content, DBMS_LOB.GETLENGTH(content)) content " +
			" from board where no="+no;
	
	conn.execute(sql, (error, result)=>{
		if(error){//레코드 선택 에러 발생시
			res.writeHead(200, {"Content-type":"text/html; charset=utf-8"});
			res.end("레코드 선택에러 발생!!!!!!");
		}else{//레코드 선택 성공
			fs.readFile("boardEdit.ejs", 'utf-8', (error, data)=>{
				if(error){// 파일 읽기 실패
					res.wirteHead(200, {"Content-type":"text/html;charset=utf-8"});
					res.end("수정 폼 파일 읽기 에러....");
				}else{// 파일 읽기 성공
					res.writeHead(200, {"Content-type":"text/html;charset=utf-8"});
					res.end(ejs.render(data,{records:result}));
				}
			});
		}
	});
});
//글 수정(update)
app.post('/editOk', (req, res)=>{
	var no = req.param('no');
	var userid = req.param('userid');
	var subject = req.param("subject");
	var content = req.param('content');
	
	var sql = "update board set subject='"+subject+"', content='"+content+"' where no="+no+" and userid='"+userid+"'";
	
	conn.execute(sql, (error, result)=>{
		console.log('result->'+result);
		console.log('result.rowsAffected--->'+result.rowsAffected);
		if(result.rowsAffected<=0){//수정 실패
			//글 수정 폼으로 이동
			// 리다이렉트 처리방식
			res.statusCode = 302; // 302 : url이 리다이렉트로 이동한다.
			res.setHeader('Location','/boardEdit?no='+no);
			res.end();
		}else{//수정 성공
			//글내용보기로 이동
			res.statusCode = 302;
			res.setHeader('Location','/boardView?no='+no);
			res.end();
		}
	});
});

//레코드 삭제
app.get('/boardDel', (req, res)=>{
	var no = req.param('no');
	
	var sql = "delete from board where no="+no;
	
	conn.execute(sql, (error, result)=>{
		if(error){
			res.statusCode = 302;
			res.setHeader('Location', '/boardView?no='+no);
			res.end();
		}else{
			res.statusCode = 302;
			res.setHeader('Location', '/list');
			res.end();
		}
	});
});
///=접속대기===================================================================
server.listen(15005, ()=>{
	console.log("server start~~~~~ http://127.0.0.1:15005/home");
});

//=================================로그인======================================
var session = require('express-session');

//로그인 폼
app.get('/login', (req, res)=>{
	
	fs.readFile("login.html", 'utf-8', (error, data)=>{
		if(error){
			res.writeHead(200, {"Content-type":"text/html; charset=utf-8"});
			res.end('로그인 폼 읽기 실패...');
		}else{
			res.writeHead(200, {"Content-type":"text/html; charset=utf-8"});
			res.end(data);
		}
	});
});

//로그인
app.post('/loginOk', (req, res)=>{
	var userid = req.param('userid');
	var userpwd = req.param('userpwd');
	console.log(userid+", "+userpwd);
	
	//아이디, 이름을 선택
	var sql = "select userid, username from register " +
			" where userid='"+userid+"' and userpwd='"+userpwd+"'";
	
	conn.execute(sql, (error, result)=>{
		if(result.rows.length==0){//로그인 실패
			fs.readFile('login.html','utf-8',function(error, data){
				res.writeHead(200, {'Content-type':'text.html; charset=utf-8'});
				res.end(data);
			});
		}else{//로그인 성공
			console.log(result+"??");
			
			//세션 설정
			session.user = {
				userid : result.rows[0][0],
				username : result.rows[0][1],
				logStatus : 'Y'
			};
			console.log("======================session======================");
			console.log(session.user);
			
			fs.readFile('home.ejs', 'utf-8', (error, data)=>{
				if(error){
					res.writeHead(200, {"Content-type":"text/html; charset=utf-8"});
					res.end("404 page error");
				}else{
					res.writeHead(200, {"Content-type":"text/html; charset=utf-8"});
					res.end(ejs.render(data, {user:session.user, logStatus:'Y'}));
				}
			});
		}
	});
});

//로그아웃
app.get('/logout', function(req, res){
	if(session.user){//로그인 상태일때
		//세션정보 제거
		session.user = null;
		
		fs.readFile('home.ejs','utf-8',function(error, data){
			res.writeHead(200, {"Contetn-type":"text/html;charset=utf-8"});
			res.end(ejs.render(data, {logStatus:'N'}));
		});
		console.log(session.user);
	}
});





