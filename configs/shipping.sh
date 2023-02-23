[Unit]
Description=Shipping Service

[Service]
User=roboshop
Environment=CART_ENDPOINT=cart-dev.devopsprabhu.online:8080
Environment=DB_HOST=mysql-dev.devopsprabhu.online
ExecStart=/bin/java -jar /app/shipping.jar
SyslogIdentifier=shipping

[Install]
WantedBy=multi-user.target