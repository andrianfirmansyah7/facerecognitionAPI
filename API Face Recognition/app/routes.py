from app import app
from app.controller import PemilihController


@app.route('/pemilih')
def users():
    return PemilihController.index()

@app.route('/recog', methods=['GET'])
def recognition():
    return PemilihController.recognition()

@app.route('/pemilih/<id>')
def usersDetail(id):
    print(id)
    return PemilihController.show(id)