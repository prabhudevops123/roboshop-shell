code_dir=$(pwd)
log_file=/tmp/roboshop.log
rm -f ${log_file}

print_head() {
  echo -e "\e[36m$1\e[0m"
}
print_head "Installing nginx"
yum install nginx -y &>>${log_file}

print_head "Removing Old Content"
rm -rf /usr/share/nginx/html/* &>>${log_file}

print_head "Downloading Frontend Content"
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip &>>${log_file}
cd /usr/share/nginx/html
unzip /tmp/frontend.zip &>>${log_file}

print_head "\Copying Nginx config for Roboshop"
# cp ${code_dir}/configs/nginx.roboshop.conf etc/nginx/default.d/roboshop.conf
cp ${code_dir}/configs/nginx-roboshop.conf /etc/nginx/default.d/roboshop.conf &>>${log_file}

print_head "Enabling Nginx"
systemctl enable nginx &>>${log_file}

echo -e "Restart Nginx"
systemctl restart nginx &>>${log_file}
