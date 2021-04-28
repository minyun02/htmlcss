// 동영상 스트리밍 처리하기

var http = require('http');
var fs = require('fs');
var mime = require('Mime');

var server = http.createServer((request,response)=>{
   var mapping = request.url; //==>접속한 /html이 구해짐
   
   //html 페이지 요청이 들어왔을떄
   if(mapping=="/html"){
      fs.readFile(__dirname+'\\node13_video_image.html','UTF-8',(error,data)=>{
         if(error){
            //읽기실패
            response.writeHead(200,{"Content-Type":"text/html; charset=UTF-8"});
            response.end("404 error Page.....");
         }else{
            //읽기성공
            response.writeHead(200,{"Content-Type":"text/html; charset=UTF-8"});
            response.end(data);
         }
      });
      
   }else if(mapping.indexOf('/images')==0){//이미지 접속일 경우 /images/파일명
      var imgMime = mime.getType(mapping.substring(1));
      fs.readFile("../"+mapping.substring(1), (error,imgData)=>{
         if(!error){
            //읽
            response.writeHead(200,{"Content-Type": imgMime});
            response.end(imgData)
         }
      });
   }else{
      //url이 잘못됬을떄
      response.writeHead(200,{"Content-Type":"text/html; charset=UTF-8"});
      response.end("404 error Page.....");
   }
});

server.listen(14001,()=>{
   console.log('server start.......      http://127.0.0.1:14001/html');
});