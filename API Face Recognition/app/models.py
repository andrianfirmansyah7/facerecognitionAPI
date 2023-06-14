from app import db
from datetime import datetime

class Tps(db.Model):
    id = db.Column(db.BigInteger, primary_key=True, autoincrement=True)
    no_tps = db.Column(db.String(5), nullable=False)
    alamat = db.Column(db.String(230), nullable=False)
    
    def __repr__(self):
        return '<Tps {}>'.format(self.name)

class Pemilih(db.Model):
    id = db.Column(db.BigInteger, primary_key=True)
    nama = db.Column(db.String(100), nullable=False)
    jenis_kelamin = db.Column(db.String(10), nullable=False)
    foto_ktp = db.Column(db.String(100), nullable=False)
    tps = db.Column(db.BigInteger, db.ForeignKey(Tps.id))

    def __repr__(self):
        return '<Pemilih {}>'.format(self.name)

class Verifikasi(db.Model):
    id_verifikasi = db.Column(db.BigInteger, primary_key=True)
    waktu_verifikasi = db.Column(db.DateTime, default=datetime.utcnow)
    status = db.Column(db.String(20), nullable=False)
    evidence = db.Column(db.String(100), nullable=False)
    tps = db.Column(db.BigInteger, nullable=False)

    def __repr__(self):
        return '<Verifikasi {}>'.format(self.name)