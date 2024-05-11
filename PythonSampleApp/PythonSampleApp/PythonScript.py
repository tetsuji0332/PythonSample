def hello_world():
    return "pythonScript hollo world!"

def hello(name):
  return f"Hello, {name}! (From Python 💃)"


def ggg():
    import json
    json_str = '''
    {
       "name" : "太郎",
       "age" : 20
    }
    '''
    json_dict = json.loads(json_str)
    return json_dict


def isImage(imageData):
    dict_data = json.loads(imageData) # jsonを辞書に変換

    
    img = base64.b64decode(dict_data) # base64に変換された画像データを元のバイナリデータに変換 # bytes
    img = BytesIO(img) # _io.BytesIO pillowで扱えるように変換
    img = Image.open(img)
    img_shape = img.size # 取得した画像で適当に処理

    text = dict_data["text"] + "fuga" #取得したテキストで適当に処理

    # 処理結果をクライアントに返す
    response = {
        "text":text,
        "img_shape":img_shape
        }

    return jsonify(response)

