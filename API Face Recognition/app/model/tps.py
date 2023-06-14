from app import db
from datetime import datetime

class Tps(db.Model):
    id = db.Column(db.BigInteger, primary_key=True, autoincrement=True)
    no_tps = db.Column(db.String(5), nullable=False)
    alamat = db.Column(db.String(230), nullable=False)
    
    def __repr__(self):
        return '<Tps {}>'.format(self.name)