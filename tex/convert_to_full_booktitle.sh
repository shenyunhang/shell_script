#!/bin/bash

#SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P  )"



echo "CVPR"
sed -i 's/{CVPR}/{IEEE\/CVF Conference on Computer Vision and Pattern Recognition (CVPR)}/g'  $1

echo "ICCV"
sed -i 's/{ICCV}/{IEEE International Conference on Computer Vision (ICCV)}/g'  $1

echo "ECCV"
sed -i 's/{ECCV}/{European Conference on Computer Vision (ECCV)}/g'  $1

echo "ICML"
sed -i 's/{ICML}/{International Conference on Machine Learning (ICML)}/g'  $1

echo "NeurIPS and NIPS"
sed -i 's/{NeurIPS}/{Conference on Neural Information Processing Systems (NeurIPS)}/g'  $1
sed -i 's/{NIPS}/{Conference on Neural Information Processing Systems (NIPS)}/g'  $1

echo "ICLR"
sed -i 's/{ICLR}/{The International Conference on Learning Representations (ICLR)}/g'  $1

echo "IJCAI"
sed -i 's/{IJCAI}/{International Joint Conferences on Artificial Intelligence (IJCAI)}/g'  $1

echo "AAAI"
sed -i 's/{AAAI}/{AAAI Conference on Artificial Intelligence (AAAI)}/g'  $1

echo "MICCAI"
sed -i 's/{MICCAI}/{International Conference on Medical Image Computing and Computer Assisted Intervention (MICCAI)}/g'  $1

echo "BMVC"
sed -i 's/{BMVC}/{The British Machine Vision Conference (BMVC)}/g'  $1

echo "AISTATS"
sed -i 's/{AISTATS}/{International Conference on Artificial Intelligence and Statistics (AISTATS)}/g'  $1

echo "ACCV"
sed -i 's/{ACCV}/{Asian Conference on Computer Vision (ACCV)}/g'  $1

#echo ""
#sed -i 's/{}/{ ()}/g'  $1

#echo ""
#sed -i 's/{}/{ ()}/g'  $1

echo "IJCV"
sed -i 's/{IJCV}/{International Journal of Computer Vision (IJCV)}/g'  $1

echo "TPAMI"
sed -i 's/{TPAMI}/{IEEE Transactions on Pattern Analysis and Machine Intelligence (TPAMI)}/g'  $1

echo "TIP"
sed -i 's/{TIP}/{IEEE Transactions on Image Processing (TIP)}/g'  $1

echo "TNNLS"
sed -i 's/{TNNLS}/{IEEE Transactions on Neural Networks and Learning Systems (TNNLS)}/g'  $1

echo "AI"
sed -i 's/{AI}/{Artificial Intelligence (AI)}/g'  $1

#echo ""
#sed -i 's/{}/{ ()}/g'  $1

#echo ""
#sed -i 's/{}/{ ()}/g'  $1
