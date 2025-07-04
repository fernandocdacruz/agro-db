from db.connection_factory import DB
from model.dao.dao_factory import DaoFactory
from model.dao.fornecedores_dao import FornecedoresDao

fornecedor_dao = DaoFactory.create_fornecedores_dao()

def listar_todos_fornecedores():
    print("")
    lista_fornecedores = fornecedor_dao.listar_fornecedores()
    if len(lista_fornecedores) == 0:
        print("\nNão há fornecedores cadastrados ainda.")
    else:
        for fornecedor in lista_fornecedores:
            print(fornecedor)