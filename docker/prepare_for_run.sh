#!/bin/bash
VERSION_ID=$(sed -nr '/VERSION_ID/s/^VERSION_ID="(.*)"$/\1/gp' /etc/os-release)
if [ "$(arch)" == "x86_64" ];then
    if [ "$VERSION_ID" == "18.04" ];then
        ExecStar=/sbin/ldconfig
    elif [ "$VERSION_ID" == "20.03" ];then
        ExecStar=/usr/sbin/ldconfig
        curl -LJO https://github.com/modelbox-ai/modelbox-binary/releases/download/BinaryArchive/cpprestsdk_2.10.15.tar.gz
        curl -LJO https://github.com/modelbox-ai/modelbox-binary/releases/download/BinaryArchive/duktape_2.6.0.tar.gz
        curl -LJO https://github.com/modelbox-ai/modelbox-binary/releases/download/BinaryArchive/ffmpeg_4.4.tar.gz
        curl -LJO https://github.com/modelbox-ai/modelbox-binary/releases/download/BinaryArchive/opencv_4.2.0.tar.gz
    fi
    curl -LJO https://github.com/modelbox-ai/modelbox-binary/releases/download/BinaryArchive/obssdk_3.22.3.tar.gz
elif [ "$(arch)" == "aarch64" ];then
    if [ "$VERSION_ID" == "18.04" ];then
        ExecStar=/sbin/ldconfig
    elif [ "$VERSION_ID" == "20.03" ];then
        ExecStar=/usr/sbin/ldconfig
        curl -LJO http://download.modelbox-ai.com/third-party/aarch64/cpprestsdk_2.10.15.tar.gz
        curl -LJO http://download.modelbox-ai.com/third-party/aarch64/duktape_2.6.0.tar.gz
        curl -LJO http://download.modelbox-ai.com/third-party/aarch64/ffmpeg_4.4.tar.gz
        curl -LJO http://download.modelbox-ai.com/third-party/aarch64/opencv_4.2.0.tar.gz
    fi
    curl -LJO http://download.modelbox-ai.com/third-party/aarch64/obssdk_3.22.3.tar.gz
else
    echo "build error"
    exit 1
fi

ls -lh ./
ls -lh ./release
