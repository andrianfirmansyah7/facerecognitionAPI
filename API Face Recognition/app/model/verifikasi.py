from app import db
from datetime import datetime
from app.model.tps import Tps
from app.model.pemilih import Tps

class Verifikasi(db.Model):
    id_verifikasi = db.Column(db.BigInteger, primary_key=True)
    pemilih = db.Column(db.BigInteger, nullable=False)
    waktu_verifikasi = db.Column(db.DateTime, default=datetime.utcnow)
    status = db.Column(db.String(20), nullable=False)
    evidence = db.Column(db.String(100), nullable=False)
    tps = db.Column(db.BigInteger, nullable=False)

    def __repr__(self):
        return '<Verifikasi {}>'.format(self.name)