#!/bin/bash
echo "PocketMine-MP 설치중......"; 
wget https://jenkins.pmmp.io/job/PocketMine-MP/lastBuild/artifact/PocketMine-MP.phar; // 수정해야 할뜻..
echo "PHP바이너리 설치중.....";
wget https://jenkins.pmmp.io/job/PHP-8.0-Aggregate/lastSuccessfulBuild/artifact/PHP-8.0-Linux-x86_64.tar.gz; // 링크 수정에 따른 변경
tar -xzvf PHP-8.0-Linux-x86_64.tar.gz; // 상단 다운로드 변경에 따라 변경
echo "start.sh 설치중"; // 유지 
wget https://raw.githubusercontent.com/pmmp/PocketMine-MP/master/start.sh; // 유지
chmod 777 start.sh; // 변경
echo "설치완료!!"; // 유지
EXTENSION_DIR=$(find "$(pwd)/bin" -name *debug-zts*); // 
grep -q '^extension_dir' bin/php7/bin/php.ini && sed -i'bak' "s{^extension_dir=.*{extension_dir=\"$EXTENSION_DIR\"{" bin/php7/bin/php.ini || echo "extension_dir=\"$EXTENSION_DIR\"" >> bin/php7/bin/php.ini;
