/**
 * http://127.0.0.1:15005/home
 */
var http = require('http');
var fs = require('fs');
var mime = require('Mime');

var express = require('express');


//express 객체 생성
var app = express();
var server = http.createServer(app);

//서버에 접속시 get방식으로 접속하면 get(), post방식으로 접속시 post()함수를 사용한다.
app.get('/home', function(request, response){
	fs.readFile(__dirname+"\\home.html", 'utf-8', function(error, data){
		if(error){
			response.writeHead(200, {"Content-type":"text/html; charset=utf-8"});
			response.end('파일읽기 에러발생');
		}else{
			response.writeHead(200, {"Content-type":"text/html; charset=utf-8"});
			response.end(data);
		}
	});
});
//게시판 목록
app.get('/list', function(req, res){
	fs.readFile(__dirname+"\\boardList.ejs", function(error, data){
		if(!error){
			res.writeHead(200, {"Content-type":"text/html; charset=utf-8"});
			res.end(data);
		}
	});
});
//글쓰기 폼
app.get('/boardWrite', (req, res)=>{
	fs.readFile(__dirname+"\\boardWrite.html", function(e, d){
		if(!e){
			res.writeHead(200, {"Content-type":"text/html; charset=utf-8"});
			res.end(d);
		}
	});
});

///=접속대기===================================================================
server.listen(15005, ()=>{
	console.log("server start~~~~~ http://127.0.0.1:15005/home");
});