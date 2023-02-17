code_dir=$(pwd)

yum install nginx -y

echo -e "\e[35mRemoving Old Content\e[0m"
rm -rf /usr/share/nginx/html/*

echo -e "\e[35mDownloading Frontend Content\e[0m"
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip
cd /usr/share/nginx/html
unzip /tmp/frontend.zip

echo -e "\e[35mCopying Nginx config for Roboshop\e[0m"
cp ${code_dir}/configs/nginx.roboshop.conf etc/nginx/default.d/roboshop.conf

echo -e "\e[35mEnabling Nginx\e[0m"
systemctl enable nginx

echo -e "\e[35mRestart Nginx\e[0m"
systemctl restart nginx
