import cv2
import numpy as np
import base64
import requests
import os
import tempfile


def runScript():
    return "RunPythonScript: Successed"

def compareImage(targetImageString, comparingImageString):
    return compareHistogram(targetImageString, comparingImageString)

# ヒストグラム比較
def compareHistogram(targetImageString, comparingImageString):
    targetHist = calcHistgram(targetImageString)
    comparingHist = calcHistgram(comparingImageString)
    return cv2.compareHist(targetHist, comparingHist, 0)


def calcHistgram(imageString):
    IMG_SIZE = (200, 200)
    image = decodeToCv2Image(imageString)
    image = cv2.resize(image, IMG_SIZE)
    return cv2.calcHist([image], [0], None, [256], [0, 256])


# base64Stringを画像に変換
def decodeToCv2Image(encodedString):
    if "base64," in encodedString:
        encodedString = encodedString.split(",")[1]
    image = base64.b64decode(encodedString)
    img_raw = np.frombuffer(image, np.uint8)
    return cv2.imdecode(img_raw, cv2.IMREAD_UNCHANGED)


# idからダウンロードした画像を返却
def getPokemonDefaultImage(pokemonId):
    url = "https://pokeapi.co/api/v2/pokemon/" + pokemonId + "/"
    response = requests.get(url, timeout=5)
    response = response.json()
    return response['sprites']['front_default']


# 特徴点一致比較
def ggg(imageString0, imageString1):
    IMG_SIZE = (200, 200)
    # エンコードサンプルコード
    # data = image
    # data_enc = data.encode('utf-8')
    # data_b64 = base64.b64encode(data_enc)
    targetPokemonImage = getPokemonDefaultImage("2")
    targetBase64 = targetPokemonImage.encode('utf-8')
    targetBase64String = base64.b64encode(targetBase64).decode('utf-8')
    targetImage = decodeToCv2Image(targetBase64String)
    
    # targetImage = cv2.resize(targetImage, IMG_SIZE)
    # targetHist = cv2.calcHist([targetImage], [0], None, [256], [0, 256])

    # bf = cv2.BFMatcher(cv2.NORM_HAMMING)
    # # detector = cv2.ORB_create()
    # detector = cv2.AKAZE_create()
    # (target_kp, target_des) = detector.detectAndCompute(targetImage, None)

    comparingImage0 = decodeToCv2Image(imageString0)
    
    comparingImage0 = cv2.resize(comparingImage0, IMG_SIZE)
    comparingHist0 = cv2.calcHist([comparingImage0], [0], None, [256], [0, 256])

    comparingImage = decodeToCv2Image(imageString1)
    
    comparingImage = cv2.resize(comparingImage, IMG_SIZE)
    comparingHist = cv2.calcHist([comparingImage], [0], None, [256], [0, 256])

    return cv2.compareHist(comparingHist0, comparingHist, 0)

    # ヒストグラム一致率を返却
    return cv2.compareHist(targetHist, comparingHist, 0)
    # 一致数を返却
    # return np.count_nonzero(targetImage == comparingImage)
    # 同じかどうかを返却
    return np.array_equal(targetImage, comparingImage)