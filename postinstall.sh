echo "The package was installed!  Yay!" > /etc/wowza
cat /etc/wowza

/bin/mkdir -p /usr/share/nginx/html 2>/dev/null
/bin/cp -v /app/nate-test/content.html /usr/share/nginx/html/index.html
/bin/cp -v spintest.conf /etc/nginx/sites-enabled/spintest.conf
/usr/sbin/service nginx restart
