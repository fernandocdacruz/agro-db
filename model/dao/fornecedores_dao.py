from model.entities.fornecedores import Fornecedores
import mysql.connector

class FornecedoresDao:

    def __init__(self, connection):
        self.conn = connection

    def listar_fornecedores(self):
        fornecedores = []
        sql = "SELECT id, nome FROM fornecedores"
        with self.conn.cursor() as cursor:
            cursor.execute(sql)
            resultados = cursor.fetchall()
            for row in resultados:
                   fornecedor = Fornecedores(id=row[0], nome=row[1])
                   fornecedores.append(fornecedor)
            return fornecedores