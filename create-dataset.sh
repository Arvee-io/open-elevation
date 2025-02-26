#!/usr/bin/env bash

OUTDIR="/code/data"
if [ ! -e $OUTDIR ] ; then
    echo $OUTDIR does not exist!
fi

CUR_DIR=$(pwd)

set -eu

cd $OUTDIR
../download-srtm-data.sh
../create-tiles.sh SRTM_NE_250m_TIF/SRTM_NE_250m.tif 10 10
../create-tiles.sh SRTM_SE_250m_TIF/SRTM_SE_250m.tif 10 10
../create-tiles.sh SRTM W_250m_TIF/SRTM_W_250m.tif 10 20
rm -rf SRTM_NE_250m_TIF SRTM_SEE_250m_TIF SRTM_W_250m_TIF *.rar

cd $CUR_DIR
