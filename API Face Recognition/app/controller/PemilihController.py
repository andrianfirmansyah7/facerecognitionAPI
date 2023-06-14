from app.model.pemilih import Pemilih
from app.model.verifikasi import Verifikasi
from app import response, app, db
from deepface import DeepFace
from retinaface import RetinaFace
from flask import request
import base64
import numpy as np
import cv2

def index():
    try:
        users = Pemilih.query.all()
        data = transform(users)
        return response.ok(data, "")
    except Exception as e:
        print(e)

def transform(users):
    array = []
    for i in users:
        array.append(singleTransform(i))
    return array

def show(id):
    try:
        users = Pemilih.query.filter_by(id=id).first()
        if not users:
            return response.badRequest([], 'Empty....')

        data = singleTransform(users)
        return response.ok(data, "")
    except Exception as e:
        print(e)

def singleTransform(users):
    data = {
        'nim': users.id,
        'nama': users.nama_pemilih,
        'alamat': users.alamat
    }

    return data

def recognition():
    id = request.form.get('id') 
    img = request.form.get('img')
    tps = request.form.get('tps')
    users = Pemilih.query.filter_by(id=id).first()
    verif = Verifikasi.query.filter_by(pemilih=id).first()
    if users is not None:
        if users is not None:
            if int(tps) == users.tps:
                pilih = users.id
                recognition = DeepFace.verify(img1_path='app/src/dataset/'+users.foto_ktp,img2_path='app/src/evidence/'+img, model_name='Facenet512',detector_backend='mtcnn', distance_metric='cosine')
                verified = recognition["verified"]
                if verified == True:
                    tambah = Verifikasi(pemilih = pilih, status=verified, evidence=img, tps=tps)
                    db.session.add(tambah)
                    db.session.commit()
                    return response.ok('', recognition["distance"])
                else:
                    return response.ok('', "Wajah tidak dikenali")
            else:
                return response.ok('','TPS tidak sesuai')
        else:
            return response.ok('','Anda sudah melakukan verifikasi sebelumnya')
    else:
        return response.ok('', 'Nomor ID Tidak ditemukan')