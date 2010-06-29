//write a POST

var request = connection.request("POST", uri, { 
   'host':'github.com', 
   "User-Agent": "NodeJS HTTP Client", 
   'Content-Length': post_data.length, 
 }); 
request.write(post_data); 
request.close(); 

