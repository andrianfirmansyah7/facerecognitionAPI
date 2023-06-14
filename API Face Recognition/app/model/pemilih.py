from app import db
from datetime import datetime
from app.model.tps import Tps

class Pemilih(db.Model):
    id = db.Column(db.BigInteger, primary_key=True)
    nama = db.Column(db.String(100), nullable=False)
    jenis_kelamin = db.Column(db.String(10), nullable=False)
    foto_ktp = db.Column(db.String(100), nullable=False)
    tps = db.Column(db.BigInteger, db.ForeignKey(Tps.id))

    def __repr__(self):
        return '<Pemilih {}>'.format(self.name)