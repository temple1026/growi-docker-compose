growi-docker-compose for Raspberry Pi
=====================

これなに?
---------
- Growiのdocker-compose版([growi-docker-compose](https://github.com/weseek/growi-docker-compose))をRaspberry Pi(以下ラズパイ)上のdocker-composeで実行できるように修正したものです
  - ラズパイのDocker-composeで動かすには，ラズパイの設定の変更が必要なので，注意点を確認してください．

- オリジナル版との大きな違いは [Dockerfile](./Dockerfile), [Dockerfile of Elasticsearch](./elasticsearch/Dockerfile), [docker-compose.yml](./docker-compose.yml)の3点で，ラズパイのプロセッサであるarm64v8用に書き直しました．

- ```docker-compose up -d --build```で実行する前に，[docker-compose.yml](./docker-compose.yml)で設定を確認してください．詳細は[本家](https://github.com/weseek/growi-docker-compose)に詳しいことが書かれているので，そちらで確認をお願いします.
  - growiのデータは，初期では./dataに保存されるので[docker-compose.yml](./docker-compose.yml)のvolumesを適宜修正してください．

注意点
--------
- Mongo3 は64bit版のOSしかサポートしていないので，ラズパイのカーネルを64bit版に修正する必要があります．
  - アップグレード方法は[こちら](https://www.raspberrypi.org/forums/viewtopic.php?t=250730)に書いてある通りです．(アップグレードは自己責任でお願いします)
- ラズパイのdockerとdocker-composeも64bit版をインストールする必要があります．
  - docker のインストール方法については[こちら](https://docs.docker.com/engine/install/binaries/). 
- ラズパイ3B+(1GB RAM)を使用している場合はスワップメモリを増やす必要があります(RAMが少ないとビルド中に固まるため)．参考までに，私の環境では100MBから2048MBに変更しました．
  - Raspberry Pi4の4GBではメモリが十分にあるので，恐らくスワップメモリを増やす必要はありません
- ビルドには30分以上かかります


動作環境
---------
- 動作を確認した環境は以下の通りです．

  - Raspberry Pi 3 model B+
  - OS: Raspbian Buster ver2010-09-29
  - Docker: 19.03.5
  - Docker-compose: 1.21.0
  - Kernel:  5.4.49-v8+
  - Growi: 4.0.7
  - mongo: 3.6
  - elasticsearch: 6.6.1
  - nodejs: 10.18.1

ライセンス
---------
* The MIT License (MIT)
* See LICENSE file.

以下英語版

What is this?
---------
- This repository was forked from [growi-docker-compose](https://github.com/weseek/growi-docker-compose) and modified for running on Raspberry Pi.
  - The setting changes of Raspberry Pi is required. Please see Warning. 

- The main differences from the original are the main [Dockerfile](./Dockerfile), [Dockerfile of Elasticsearch](./elasticsearch/Dockerfile), and [docker-compose.yml](./docker-compose.yml).

- Before running ```docker-compose up -d --build```, please check the settings in [docker-compose.yml](./docker-compose.yml).
  The detail is [here](https://github.com/weseek/growi-docker-compose).

    - The data of growi will save in ./data initially. Please change volumes of [docker-compose.yml](./docker-compose.yml) in advance.

Warning
---------
  - Since Mongo3 supports a 64-bit kernel only, so __RaspberryPi must be running on the 64-bit kernel__.
    - A detail how to upgrade to the 64-bit kernel is [here](https://www.raspberrypi.org/forums/viewtopic.php?t=250730)
  - You __need to install the 64bit version of docker and docker-compose.__
    - I installed the 64-bit docker from binary. Please see [here](https://docs.docker.com/engine/install/binaries/). 
  - If you use Raspberry Pi which does not have small memory, e.g. Raspberry Pi 3B+, 1GB RAM, __you need to change the swap size of RAM__. In my case, changed 100MB to 2048MB.
  - It takes __at least 30 minutes__ to build growi on Raspberry Pi 3B+. 

My environment
---------
  - Raspberry Pi 3 model B+
  - OS: Raspbian Buster ver2010-09-29
  - Docker: 19.03.5
  - Docker-compose: 1.21.0
  - Kernel:  5.4.49-v8+
  - Growi: 4.0.7
  - mongo: 3.6
  - elasticsearch: 6.6.1
  - nodejs: 10.18.1

License
---------
* The MIT License (MIT)
* See LICENSE file.


