alias http-server='\http-server -p 8080 -o' # install: npm i -g http-server
alias http-server-ssl='\http-server -p 8443 -o --ssl --cert ~/.ssl/localhost.pem --key ~/.ssl/localhost.pem '
alias https-server='http-server-ssl'